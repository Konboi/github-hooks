require 'github/hooks'

def foo(req)
  puts req
end

hooks = Github::Hooks.set do |hook|
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
