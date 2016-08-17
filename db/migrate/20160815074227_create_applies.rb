class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.integer :mentor_id
      t.integer :user_id
      
      t.text  :area
      t.string :from
      t.string :to
      t.integer :numOfMem
      t.string :themeOfPlan
      t.text :hotel
      t.integer :money
      t.text :request
      
      
      t.timestamps null: false
    end
  end
end
