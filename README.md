# Github::Hooks

Gtihub Event Proxy Server

Set webhook content type `application/x-www-from-urlencoded`

![img](http://i.gyazo.com/92aaaf4b8b5cb9d606f1265f02ff208e.png)

## Events

You can use these events

* `pull request`  => `on_pull_request`
* `push`          => `on_push`
* `issues`        => `on_issues`
  * `issues` is create issue event
* `issue_comment` => `on_issue_comment`

## Installation

Add this line to your application's Gemfile:

    gem 'github-hooks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github-hooks

## Usage


```ruby
require 'github/hooks'

def foo(req)
  puts req
end

hooks = Github::Hooks.set do |hook|
  hook.port = 9876
  hook.on_push do |request|
    puts 'push'
  end

  hook.on_pull_request do |request|
    puts 'pull req'
  end

  hook.on_issue_comment do |request|
    foo
  end
end

Rack::Handler::WEBrick.run(hooks.server, :Port => hooks.port)

```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/github-hooks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
