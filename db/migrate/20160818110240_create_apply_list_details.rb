class CreateApplyListDetails < ActiveRecord::Migration
  def change
    create_table :apply_list_details do |t|
      
      #list_id : 
      t.integer "id_of_mentor"
      t.integer "user_id"
      t.integer "auction_price" # 최종 가격이적힌 
      t.integer "complete"  # 입찰이 끝났는지.. 1이면 해결 , 0 이면 아직 진행중인 것 .
      
      
      
      # form 에서 받는 내용
      t.string "mentor_area"
      t.string "from"
      t.string "to"
      t.integer "numOfMem"
      t.string "themeOfPlan"
      t.integer "budget"
      t.text "mentor_content"
      t.text "accomodation" 
      
      t.timestamps null: false
    end
  end
end
