module Github
  module Hooks
    class Event
      attr_accessor :evnets

      def initialize(options = {})
        @events = {}

        options.each do |k,v|
          send("#{k}=",v)
        end
      end

      def on_push(&blk)
        puts 'hoge'
      end

      def on_pull_request(&blk)
      end

      def on_comment(&blk)
      end

      def self.set(options = {}, &blk)
        event = new(options)
        event.instance_eval &blk
      end
    end
  end
end
