class SorceryRememberMe < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remember_me_token, :string, :default => nil
    add_column :users, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :users, :remember_me_token
    add_index :users, :email, unique: true
  end
end
