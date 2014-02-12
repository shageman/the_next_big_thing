class RemoveEntry < ActiveRecord::Migration
  def change
    drop_table :teaser_entries
  end
end
