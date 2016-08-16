class MentoringController < ApplicationController
  
  def  mentoring_apply_form_1
    @user = current_user 
  end
  
  def  mentoring_apply_form_2
    @user = current_user 
  end
  
  def success
    @user = current_user
 
    apply =Apply.new
    apply.user_id = params[:id_of_user] 
    apply.area  = params[:mentor_area]
    apply.from = params[:from]
    apply.to = params[:to]
    apply.numOfMem = params[:numOfMem] 
    apply.themeOfPlan = params[:themeOfPlan]
    apply.hotel = params[:accomodation]
    apply.money = params[:budget]
    apply.request = params[:mentor_content]
    apply.save
    
    
    
    m = Mentor.all
    cnt = 0 ;
    m.each do |men|
      if men.area == apply.area
             men.applies << apply
            # alert 기능이 필요함 
            men.save
            cnt +=1 
       end 
    end 
    if cnt == 0 
       # 해당하는 멘토가 한명도 없을 때 ,예외 처리 
    end
        
      
    
    
   
  end    
  def mentoring_auction
    @user = current_user
  end
 
end
