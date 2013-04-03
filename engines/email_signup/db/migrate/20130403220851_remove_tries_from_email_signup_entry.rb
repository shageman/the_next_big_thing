class RemoveTriesFromEmailSignupEntry < ActiveRecord::Migration
  def change
    remove_column :email_signup_entries, :tries
  end
end
