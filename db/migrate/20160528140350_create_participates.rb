class CreateParticipates < ActiveRecord::Migration
  def change
    create_table :participates do |t|
      
      t.integer   :number
      t.string    :name
      t.integer   :post_id
      
      t.timestamps null: false
    end
  end
end
