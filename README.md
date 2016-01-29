# Imgflip::Cucumber

This gem contains a acceptance testing framework and some tests bundled together.  The framework uses watir-webdriver, and the application tests are written with cucumber.  The framework itself is tested with rspec.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'imgflip-cucumber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imgflip-cucumber

## Usage

Please ensure you have a chromedriver binary on your path.  See here for Installation insructions:

To run the tests run `bundle install`.  Then run `bundle exec rake cucumber` to run the cucumber tests.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
