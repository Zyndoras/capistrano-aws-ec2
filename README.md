Capistrano-AWS-EC2
==================

Your EC2 instances are behind a load balancer and change their addresses way too often? Fear no more! 
Capistrano-AWS-EC2 allows you to query your EC2 instances and add them to capistrano.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'capistrano-aws-ec2', require: false
end
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install capistrano-aws-ec2

## Usage

Add EC2 instances to your capistrano configuration:

```ruby
# config/deploy/production.rb
ec2_instances.each do |instance|
  # this could be your custom filter logic:
  next unless instance.tags.any? { |tag| tag.key == 'foo' && tag.value == 'bar' }

  server instance.public_ip_address, user: 'deploy', roles: %w[web app db], primary: true
end
```

Configure AWS:

```ruby
# config/deploy.rb or per stage
set :aws_region, 'eu-central-1' # falls back to ENV['AWS_REGION'] or ENV['AWS_DEFAULT_REGION']
set :aws_access_key_id, 'my-aws-key' # falls back to ENV["#{stage.upcase}_ACCESS_KEY_ID"] or ENV['AWS_ACCESS_KEY_ID']
set :aws_secret_access_key, 'my-aws-secret' # falls back to ENV["#{stage.upcase}_SECRET_ACCESS_KEY"] || ENV['AWS_SECRET_ACCESS_KEY']
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zyndoras/capistrano-aws-ec2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/zyndoras/capistrano-aws-ec2/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Capistrano::Aws::Ec2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/zyndoras/capistrano-aws-ec2/blob/master/CODE_OF_CONDUCT.md).
