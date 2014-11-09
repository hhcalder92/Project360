class ChangeImages < ActiveRecord::Migration
  def change
  	remove_column :images, :url, :string
  	add_column :images, :filepicker_url, :string
  end
end
