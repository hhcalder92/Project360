class ReChangeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :session_token, :string
    add_column :users, :session_token, :string
  end
end
