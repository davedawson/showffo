# Showffo App

I'm not necessarily married to any of these solutions, so if you have better ideas of doing things, please share.

## Authentication
Right now, there are two ways for users to authenticate.

* Using an email address and username. This uses [Devise](https://github.com/plataformatec/devise)
* Using the fitbit oauth. This uses the [FitGem](http://fitbitclient.com/)

## Styling
* [Sass](http://rubygems.org/gems/sass)
* [Compass](https://github.com/chriseppstein/compass)

## Markup
The markup in the app is based on [html5 Boilerplate](https://github.com/sporkd/html5-rails). This basically just sets the app up with the necessary markup and fallbacks for an HTML5 site.

## Tests
I'm not running any tests in the app right now. But maybe we should be. Eh, I could go either way. But if we want to, [Rspec](https://github.com/guard/guard-rspec) is set up and it creates new test files every time we generate something.

