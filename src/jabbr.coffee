Robot = require('hubot').Robot
Adapter = require('hubot').Adapter
TextMessage = require('hubot').TextMessage
Response = require('hubot').Response

JabbrClient = require('njabbr').JabbrClient
JabbrClientEvents = require('njabbr').JabbrClientEvents

class JabbrBot extends Adapter
    constructor: (@robot) ->
        super @robot

        @robot.notice = (user, strings...) ->
            @adapter.notice user, strings...

        @robot.Response = JabbrResponse

    send: (envelope, strings...) ->
        for str in strings
            if not str?
                continue
            if envelope.user.room
                console.log "#{envelope.user.room} #{str}"
                @bot.say(str, envelope.user.room)
            else
                console.log "#{envelope.user.name} #{str}"
                @bot.sendPrivateMessage(envelope.user.name, str)
                
    reply: (envelope, strings...) ->
        for str in strings
            if not str?
                continue
            else
                console.log "#{envelope.user.name} #{str}"
                @bot.say('@' + envelope.user.name + ' ' + str, envelope.user.room)

    join: (room) ->
        self = @
        @bot.joinRoom room, () ->
            console.log('joined %s', room)

    run: ->
        self = @
        
        options =
            nick:       process.env.HUBOT_JABBR_NICK or @robot.name
            rooms:      process.env.HUBOT_JABBR_ROOMS.split(',')
            host:       process.env.HUBOT_JABBR_HOST
            password:   process.env.HUBOT_JABBR_PASSWORD
            transport:  process.env.HUBOT_JABBR_TRANSPORT or "serverSentEvents"
            

        bot = new JabbrClient options.host, { transport: options.transport }

        bot.on 'messageReceived', (msg, room) ->
           
            user = self.userForName msg.name
            unless user?
                id = (new Date().getTime() / 1000).toString().replace('.','')
                user = self.userForId id
                user.name = msg.name

            user.room = room
            
            self.receive new TextMessage user, msg.message, msg.id
            console.log(self.receive)

        @bot = bot

        bot.connect options.nick, options.password, (task) ->
            console.log("Logged in");
            self.emit 'connected'
            
            for room in options.rooms
                bot.joinRoom room, () ->
                    console.log "Joined #{room}"
            
class JabbrResponse extends Response
    notice: (strings...) ->
        @robot.adapter.notice @message.user, strings...

exports.use = (robot) ->
    new JabbrBot robot
