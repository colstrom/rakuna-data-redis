# rakuna-data-redis

Redis support for Rakuna!

# Description

Adds support for redis to your Webmachine project, with autodetection.

# Autodetecting Redis
`rakuna-data-redis` will attempt to find the redis server address using common conventions. In order, those are:

  * `ENV['REDIS_URL']` is assumed to be a valid redis URL and is taken as-is.
  * `ENV['REDIS_PORT']` will be converted into a valid redis URL.
  * `localhost:6379` if all else fails.

To use a custom source, simply override the `redis_url` method.



# Installation
`gem install rakuna-data-redis`

# Usage
`require 'rakuna-data-redis'`

## Examples
### Fetch URL path as key from redis, and return is as plain text.
```ruby
class ExampleResource < Rakuna::Resource::Basic
  include Rakuna::Provides::Text
  include Rakuna::Data::Redis

  def output
    redis.get request.disp_path
  end
end
```

### Load redis address from YAML file
```yaml
# config.yaml
---
redis_url: redis://10.0.0.50:6379
```

```ruby
# example.rb
class ExampleResource < Rakuna::Resource::Basic
  include Rakuna::Data::Redis

  def redis_url
    @redis_url ||= YAML.load_file('config.yaml')['redis_url']
  end
end
```



# Contributing
  * Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
  * Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
  * Fork the project.
  * Start a feature/bugfix branch.
  * Commit and push until you are happy with your contribution.
  * Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
  * Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# License
[MIT](https://tldrlegal.com/license/mit-license)

# Contributors
  * [Chris Olstrom](https://colstrom.github.io/) | [e-mail](mailto:chris@olstrom.com) | [Twitter](https://twitter.com/ChrisOlstrom)
