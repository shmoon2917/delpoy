class CreateIndexOfApplies < ActiveRecord::Migration
  def change
    create_table :index_of_applies do |t|
      
      t.integer :user_id
      t.integer :mentor_id
      t.integer :list_id
      t.integer :complete # 상태 정보 표시   0 은 아무것도 x , 1 은 입찰 진행중 ,2 는 멘토 선정 됨   
      t.integer :auction_price  # 현재 멘토와 입찰 정보 
      
 
      t.timestamps null: false
    end
  end
end
