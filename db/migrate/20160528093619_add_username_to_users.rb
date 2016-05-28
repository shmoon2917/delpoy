class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    
    add_column :users, :grade, :integer
    add_index :users, :grade, unique: true
    
    add_column :users, :region, :string
    add_index :users, :region, unique: true
    
    add_column :users, :phone, :string
    add_index :users, :phone, unique: true
    
    add_column :users, :gender, :integer
    add_index :users, :gender, unique: true
    
    add_column :users, :language, :integer
    add_index :users, :language, unique: true
    
  end
end
