class MentoringController < ApplicationController
  
  def  mentoring_apply_form_1
    @user = current_user 
  end
  
  def  mentoring_apply_form_2
    @user = current_user 
  end
  
  def success
    @user = current_user
   
  end    
  def mentoring_auction
    @user = current_user
  end
  def mentoring_apply_form_3
    @user = current_user
    
    @apply =Mentoring_apply.new 
    
    @apply.area  = params[:mentor_area]
    @apply.from = params[:from]
    @apply.to = params[:to]
    @numOfMem = params[:numOfMem] 
    @themeOfPlan = params[:themeOfPlan]
    @apply.save 
    
  end 
  
end
