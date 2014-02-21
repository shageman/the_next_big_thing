class AddTriesToTeaserEntries < ActiveRecord::Migration
  def change
    add_column :teaser_entries, :tries, :integer, default: 0
  end
end
