require 'github/hooks'

def hoge
  puts 'hogehoge'
end

def fuga
  puts 'fugafuga'
end

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
    foo
  end
end

Rack::Handler::WEBrick.run(hooks.server, :Port => hooks.port)
