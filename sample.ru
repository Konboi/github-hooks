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

event = Github::Hooks::Event.set do |event|
  event.on_push do |request|
    hoge
  end

  event.on_pull_request do |request|
    fuga
  end

  event.on_comment do |request|
    foo
  end
end

run Github::Hooks::Server.new(event)
