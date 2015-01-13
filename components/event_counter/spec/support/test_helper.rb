module EventCounter
  module TestHelper
    def self.new_logger(object_identifier = nil, event_identifier = nil, count = nil)
      logger = EventCounter::Logger.new
      if object_identifier && event_identifier && count
        count.times do
          logger.log object_identifier, event_identifier
        end
      end
      logger
    end
  end
end