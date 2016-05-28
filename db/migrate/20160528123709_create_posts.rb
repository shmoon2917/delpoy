class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string :title
      t.string :about
      t.string :region
      t.string :where
      t.string :meet_time
      t.text :content
      t.integer :user_id
      t.string  :image_url ,default: ""
      t.integer  :total_num
      t.integer  :current_num, default: 1
      
      t.timestamps null: false
    end
  end
end
