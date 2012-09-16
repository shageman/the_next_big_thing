class CreateEntry < ActiveRecord::Migration
  def change
    create_table :teaser_entries do |t|
      t.string :email

      t.timestamps
    end
  end
end
