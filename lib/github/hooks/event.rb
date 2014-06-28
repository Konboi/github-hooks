module Github
  class Hooks
    class Event
      attr_accessor :events

      def initialize
        @events = {}
      end

      def set(event_name, &blk)
        @events[:"#{event_name}"] = blk
      end

      def on(event_name, *args)
        begin
          instance_exec *args, &@events[:"#{event_name}"]
        rescue => e
          info "#{e} - #{e.backtrace}"
        end
      end

      private

      def info(msg)
        puts "#{Time.now.strftime('%H:%M:%S')} #{msg}"
      end
    end
  end
end
