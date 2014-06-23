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

Github::Hooks.start do |hook|
  hook.port = 8880
  hook.on_push do |request|
    puts 'push'
  end

  hook.on_pull_request do |request|
    puts 'pull req'
  end

  hook.on_comment do |request|
    foo
  end
end
