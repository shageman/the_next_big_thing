module EventCounter
  class Logger
    def log(object_identifier, event_identifier)
      counter = Count.where(object_identifier: object_identifier, event_identifier: event_identifier).try :first
      if counter.present?
        counter.update_attribute(:count, counter.count + 1)
      else
        counter = Count.create do |count|
          count.object_identifier = object_identifier
          count.event_identifier = event_identifier
          count.count = 1
        end
      end
      counter.count
    end

    private

    class Count < ActiveRecord::Base
    end
  end
end