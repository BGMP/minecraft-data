# Minecraft::Data

Minecraft Data is a dead simple ruby gem to gather different pieces of information related to Minecraft player profiles.

Services used:
  * https://github.com/Electroid/mojang-api - API.
    * https://api.ashcon.app/mojang/v2/user/BGMP
    * https://api.ashcon.app/mojang/v2/avatar/BGMP

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minecraft-data', '~> 0.2.0'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install minecraft-data

## Usage

#### `.username_to_uuid()` `.uuid_to_username()`

Retrieve the username of a given player uuid and vice versa.

```ruby
Minecraft::Data.username_to_uuid('Notch')
Minecraft::Data.uuid_to_username('069a79f4-44e9-4726-a5be-fca90e38aaf5')
```

Output:
```
069a79f4-44e9-4726-a5be-fca90e38aaf5
Notch
```

#### `.name_history_of_username()` `.name_history_of_uuid()`

Retrieve the name history of a player by it's uuid or username.

```ruby
Minecraft::Data.name_history_of_uuid('2cef6d05-ec9a-44b3-bedc-53359c68ae65')
```

Output:
```
{"username"=>"banja13"}
{"username"=>"LeWizard23", "changed_at"=>"2015-05-01T02:27:06.000Z"}
{"username"=>"BGMP00", "changed_at"=>"2015-06-09T19:40:49.000Z"}
{"username"=>"BGMP", "changed_at"=>"2017-10-08T20:11:36.000Z"}
```

#### `.head_url_of_uuid()` `.head_url_of_username()`

Retrieves a link pointing to an image of the given user's skin head. `true` or `false` depending on whether you want the skin's overlay to be present or not.

```ruby
Minecraft::Data.head_url_of_uuid('2cef6d05-ec9a-44b3-bedc-53359c68ae65')
Minecraft::Data.head_url_of_username('BGMP')
```

Output:
```
https://api.ashcon.app/mojang/v2/avatar/2cef6d05-ec9a-44b3-bedc-53359c68ae65
https://api.ashcon.app/mojang/v2/avatar/BGMP
```

#### `normalize_uuid(uuid)`

Normalises a trimmed uuid.

```ruby
Minecraft::Data.head_url_of_uuid('2cef6d05ec9a44b3bedc53359c68ae65')
```

Output:
```
2cef6d05-ec9a-44b3-bedc-53359c68ae65
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports are welcome on GitHub at this repo's [issues tab](https://github.com/BGMP/minecraft-data/issues). This project is intended to be a safe, welcoming space for collaboration, thus I'm absolutely open to any changes to be submitted through a pull request [here](https://github.com/BGMP/minecraft-data/pulls)!

## Licence

The gem is available as open source under the terms of the [MIT Licence](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Minecraft::Data project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/minecraft-data/blob/master/CODE_OF_CONDUCT.md).
