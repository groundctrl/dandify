# Dandify

Dandify is not a theme. It is a theme helper that allows you to quickly apply versioned frontend style changes from the Spree admin. Dandify only works with stylesheets. Dandify is best used in conjunction with [Shopping Mall](https://github.com/groundctrl/shopping_mall).

## Installation

#### Bleeding edge

Add this line to your Spree application's Gemfile:

    gem 'dandify', github: 'groundctrl/dandify'

#### Gem (Not ready yet.)

Add this line to your Spree application's Gemfile:
> NOTE: Gem is yet to be released (Spree 2.3 isn't out yet.)

    gem 'dandify'

#### Generators

Run the bundle command to install it

    bundle install

After installing Dandify you'll need to run the generator:

    bundle exec rails g dandify:install

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
