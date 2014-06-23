require "github/hooks/version"
require "github/hooks/event"
require "github/hooks/server"

module Github
  class Hooks
    attr_accessor :event, :server, :port

    def initialize(options = {})
      @event  = Event.new
      @server = Server.new(@event)
      @port   = 9876

      options.each do |k, v|
        send("#{k}=", v)
      end
    end

    def self.start(options = {}, &blk)
      hook = new(options)
      hook.instance_eval &blk

      hook.server.run(hook.port)
    end

    def on_push(&blk)
      @event.set('push', &blk)
    end

    def on_pull_request(&blk)
      @event.set('pull_request', &blk)
    end

    def on_comment(&blk)
      @event.set('comment', &blk)
    end

    def start

    end
  end
end
