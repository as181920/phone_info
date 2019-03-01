# PhoneInfo

lookup ISP and geo info (province, city etc) for mobile number in China

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'phone_info', git: "git@github.com:as181920/phone_info.git", branch: "master"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phone_info

## Usage

```ruby
PhoneInfo.lookup("1381695")
# => {:province=>"上海", :city=>"上海", :postal_code=>"200000", :region_code=>"021", :isp=>"移动", :prefix=>1381695}

PhoneInfo.lookup(110)
# => nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Credits

[https://github.com/lovedboy/phone](https://github.com/lovedboy/phone)
[https://github.com/forresty/mobinfo](https://github.com/forresty/mobinfo)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/phone_info.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
