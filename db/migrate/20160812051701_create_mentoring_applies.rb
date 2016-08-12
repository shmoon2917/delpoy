class CreateMentoringApplies < ActiveRecord::Migration
  def change
    create_table :mentoring_applies do |t|
      t.integer :mentor_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
