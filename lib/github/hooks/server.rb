require 'rack'
require 'json'

module Github
  class Hooks
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

        if req.request_method == 'POST' and payload
          event_name = env["HTTP_X_GITHUB_EVENT"]

          if event_name && @event.events[:"#{event_name}"]
            @event.on(event_name, payload)
          end

          [200, [], ['OK']]
        else
          [400, [], ['BAD REQUEST']]
        end
      end
    end
  end
end
