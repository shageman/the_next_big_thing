class MoveEntriesFromTeaserToNewsSignup < ActiveRecord::Migration
  def up
    execute "INSERT INTO news_signup_entries (email, tries, created_at, updated_at) SELECT email, tries, created_at, updated_at FROM teaser_entries;"
  end

  def down
  end
end
