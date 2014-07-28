# Dandify

[![Code Climate](https://codeclimate.com/github/groundctrl/dandify.png)](https://codeclimate.com/github/groundctrl/dandify)
[![Build Status](https://travis-ci.org/groundctrl/dandify.svg?branch=master)](https://travis-ci.org/groundctrl/dandify)

Dandify is not a theme. It is a theme helper that allows you to quickly apply versioned frontend style changes from the Spree admin. Dandify only works with stylesheets. Dandify is best used in conjunction with [Shopping Mall](https://github.com/groundctrl/shopping_mall).


## Installation

#### Gem

Add this line to your Spree application's Gemfile:

    gem 'dandify'

#### Bleeding edge

Add this line to your Spree application's Gemfile:

    gem 'dandify', github: 'groundctrl/dandify'

> Note: The master branch is not guaranteed to be in a fully functioning state. It is unwise to use this branch in a production system.

#### Generators

Run the bundle command to install it:

    bundle install

After installing Dandify you'll need to run the generator:

    bundle exec rails g dandify:install

This will run migrations as well as install the styles for the admin.


## Testing

Generate a dummy application

    bundle exec rake test_app

Running tests

    bundle exec rake spec


## Contributing

1. Fork it ( https://github.com/groundctrl/dandify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
