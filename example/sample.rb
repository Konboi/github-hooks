require 'github/hooks'
require 'json'

def foo(req)
  payload = JSON.parse(req["payload"])
  puts "repository name:" + payload["repository"]["name"]
end

hooks = Github::Hooks.set do |hook|
  hook.port = 4567
  hook.on_push do |request|
    puts 'push'
  end

  hook.on_pull_request do |request|
    puts 'pull req'
  end

  hook.on_issue_comment do |request|
    foo(request)
  end
end

Rack::Handler::WEBrick.run(hooks.server, :Port => hooks.port)
