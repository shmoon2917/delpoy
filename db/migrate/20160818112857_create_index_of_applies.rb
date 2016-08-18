class CreateIndexOfApplies < ActiveRecord::Migration
  def change
    create_table :index_of_applies do |t|
      
      t.integer :user_id
      t.integer :mentor_id
      t.integer :list_id
      t.boolean :complete
      
      
      t.timestamps null: false
    end
  end
end
