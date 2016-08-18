class MentoringController < ApplicationController
  
  def  mentoring_apply_form_1
    @user = current_user 
  end
  
  def  mentoring_apply_form_2
    @user = current_user 
  end
  
  def success
    @user = current_user
    
    @a = ApplyListDetail.new 
    @a.user_id = params[:id_of_user]
      
    @a.mentor_area  = params[:mentor_area]
    @a.from = params[:from]
    @a.to = params[:to]
    @a.numOfMem = params[:numOfMem] 
    @a.themeOfPlan = params[:themeOfPlan]
    @a.accomodation = params[:accomodation]
    @a.budget = params[:budget]
    @a.mentor_content = params[:mentor_content]
 
    @a.save
    
    
    
 #   m = Mentor.all
 #   cnt = 0 ;
 #   m.each do |men|
 #     if men.area == apply.area
 #            men.applies << apply
            # alert 기능이 필요함 
 #           men.save
  #          cnt +=1 
  #     end 
  #  end 
  #  if cnt == 0 
       # 해당하는 멘토가 한명도 없을 때 ,예외 처리 
  #  end
        
      
    
    
   
  end    
  def mentoring_auction
    @user = current_user
  end
 
end
