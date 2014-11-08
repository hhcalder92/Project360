class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false 
      t.string :password_digest, null:false
      t.string :session_token, null:false
      t.timestamps
    end 
    
    # to access db faster or adding uniqueness in validations
    add_index :users, :name, unique: true
    add_index :users, :session_token, unique: true
  end 
      

  end
