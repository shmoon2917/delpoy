class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: false
    
    add_column :users, :grade, :integer
    add_index :users, :grade, unique: false
    
    add_column :users, :region, :string
    add_index :users, :region, unique: false
    
    add_column :users, :phone, :string
    add_index :users, :phone, unique: false
    
    add_column :users, :gender, :integer
    add_index :users, :gender, unique: false
    
    add_column :users, :language, :integer
    add_index :users, :language, unique: false
    
    add_column :users, :user_img_url, :string
    add_index :users, :user_img_url, unique: false
    
    
  end
end
