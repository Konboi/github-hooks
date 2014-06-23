module Github
  class Hooks
    class Event
      attr_accessor :events

      def initialize(&events)
        @events = {}
      end

      def set(event_name, &blk)
        @events[:"#{event_name}"] = blk
      end

      def on(event_name, *args)
        instance_exec *args, &@events[:"#{event_name}"]
        p event_name
      end
    end
  end
end
