class RenameNewsSignupEtnriesToEmailSignupEntries < ActiveRecord::Migration
  def change
    rename_table :news_signup_entries, :email_signup_entries
  end
end
