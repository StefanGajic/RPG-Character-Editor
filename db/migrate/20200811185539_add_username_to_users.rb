# frozen_string_literal: true

# Add Username To Users
class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
