class CreateNewsSignupEntry < ActiveRecord::Migration
  def change
    create_table "news_signup_entries", force: true do |t|
      t.string "email"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "tries", default: 0
    end
  end
end
