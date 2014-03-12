class CreateEventCounterCount < ActiveRecord::Migration
  def change
    create_table :event_counter_counts do |t|
      t.string "object_identifier"
      t.string "event_identifier"
      t.integer "count", default: 0
    end
  end
end
