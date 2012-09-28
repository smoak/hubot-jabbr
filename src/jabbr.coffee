Robot = require('hubot').Robot
Adapter = require('hubot').Adapter
TextMessage = require('hubot').TextMessage
Response = require('hubot').Response

JabbrClient = require('njabbr').JabbrClient

class JabbrBot extends Adapter
    constructor: (@robot) ->
        super @robot

        @robot.notice = (user, strings...) ->
            @adapter.notice user, strings...

        @robot.Response = JabbrResponse

    send: (user, strings...) ->
        for str in strings
            if not str?
                continue
            if user.room
                console.log "#{user.room} #{str}"
                @bot.say(str, user.room)
            else
                console.log "#{user.name} #{str}"
                @bot.sendPrivateMessage(user.name, str)
                
    reply: (user, strings...) ->
        for str in strings
            if not str?
                continue
            else
                console.log "#{user.name} #{str}"
                @bot.say('@' + user.name + ' ' + str, user.room)

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
            

        bot = new JabbrClient options.host

        bot.on 'messageReceived', (msg, room) ->
            
            user = self.userForName msg.User.Name
            unless user?
                id = (new Date().getTime() / 1000).toString().replace('.','')
                user = self.userForId id
                user.name = msg.User.Name

            user.room = room
            
            self.receive new TextMessage(user, msg.Content)

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
