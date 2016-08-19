class CreateRealMentors < ActiveRecord::Migration
  def change
    create_table :real_mentors do |t|
      t.string :area
      t.string :period
      t.text :content
      
      
      t.integer :user_id 
      
      t.timestamps null: false
    end
  end
end
