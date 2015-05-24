# Hubot Jabbr Adapter

## Description

A Hubot adapter for [Jabbr](http://jabbr.net)

## Hubot Compatibility

* Use version 0.2.x if you are using Hubot 2.3.x
* Use version 0.3.x if you are using Hubot 2.4.x
* Use version 0.4.x if you are using Hubot 2.6.x
* All other hubot versions are not supported

## Installation

* Add `hubot-jabbr` as a dependency in your hubots `package.json`
* Run `npm install` in your hubots directory.
* Run hubot with `bin/hubot -a jabbr`

## Usage

You need to set a few environment variables in order for it to work

**NB** If the nick isn't already registered on the jabbr host you are using, 
the nick will need to be registered first.

### GNU/Linux

    % export HUBOT_JABBR_HOST="http://yourjabbrhosthere.com"

    % export HUBOT_JABBR_NICK="HubotNick"

    % export HUBOT_JABBR_PASSWORD="ThePassword"

    % export HUBOT_JABBR_ROOMS="Room1,Room2,Room3"

    # Optional, you can choose the transport to use to connect to the server with. Default is serverSentEvents
    % export HUBOT_JABBR_TRANSPORT="longPolling"

    # Optional, you can set the gravatar with the following:
    % export HUBOT_JABBR_GRAVATAR="gravatar@email.com"

### Heroku

    % heroku config:add HUBOT_JABBR_HOST="http://yourjabbrhosthere.com"

    % heroku config:add HUBOT_JABBR_NICK="HubotNick"

    % heroku config:add HUBOT_JABBR_PASSWORD="ThePassword"

    % heroku config:add HUBOT_JABBR_ROOMS="Room1,Room2,Room3"

    # Optional, you can choose the transport to use to connect to the server with. Default is serverSentEvents
    % heroku config:add HUBOT_JABBR_TRANSPORT="longPolling"

    # Optional, you can set the gravatar with the following:
    % heroku config:add HUBOT_JABBR_GRAVATAR="gravatar@email.com"


### Supported transports

These transports are currently supported by njabbr:

* serverSentEvents - Uses SSE to connect to the server if the server supports it.
* longPolling - Uses long polling (i.e. a time based poll of the server info)

## Contributing

Contributions are welcome. To get your work considered please do the following:

1. Fork this project
2. Create a feature/bug fix branch
3. Hack away, committing often and frequently
4. Push your branch up to your fork
5. Submit a pull request

## License

This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details. 
