class ReChangeImages < ActiveRecord::Migration
  def change
  	remove_index :images, column: :user_id
  end
end
