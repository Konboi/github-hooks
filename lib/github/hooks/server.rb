require 'rack'
require 'json'
require 'pp'

module Github
  module Hooks
    class Server
      attr_reader :event

      def initialize(event)
        @event = event
      end

      def call(env)
        req = Rack::Request.new(env)
        begin
          payload = req.params["payload"]
        rescue => e
          [400, [], ['BAD REQUEST']]
        end

        # TODO
        # event method
        if req.request_method == 'POST' and payload
          event_name = env["X-Github-Event"]

          if (event_name)
          end

          [200, [], ['OK']]
        else
          @event.send(:on_push)
          [400, [], ['BAD REQUEST']]
        end
      end
    end
  end
end
