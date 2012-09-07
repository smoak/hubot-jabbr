# Hubot Jabbr Adapter

## Description

A Hubot adapter for [Jabbr](http://jabbr.net)

## Installation

**NOTICE** This adapter will only work with Hubot 2.3+. It will not
work with earlier versions.

* Add `hubot-jabbr` as a dependency in your hubots `package.json`
* Run `npm install` in your hubots directory.
* Run hubot with `bin/hubot -a jabbr`

## Usage

You need to set a few environment variables in order for it to work

**NB** If the nick isn't already registered on the jabbr host you are using, 
the nick will automatically get registered with the `HUBOT_JABBR_PASSWORD`
you set.

### GNU/Linux

    % export HUBOT_JABBR_HOST="http://yourjabbrhosthere.com"

    % export HUBOT_JABBR_NICK="HubotNick"

    % export HUBOT_JABBR_PASSWORD="ThePassword"

    % export HUBOT_JABBR_ROOMS="Room1,Room2,Room3"

### Heroku

    % heroku config:add HUBOT_JABBR_HOST="http://yourjabbrhosthere.com"

    % heroku config:add HUBOT_JABBR_NICK="HubotNick"

    % heroku config:add HUBOT_JABBR_PASSWORD="ThePassword"

    % heroku config:add HUBOT_JABBR_ROOMS="Room1,Room2,Room3"

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
