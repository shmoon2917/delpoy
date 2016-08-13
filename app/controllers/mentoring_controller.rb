class MentoringController < ApplicationController
  
  def  mentoring_apply_form_1
    @user = current_user 
  end
  
  def  mentoring_apply_form_2
    @user = current_user 
  end
  
  def success
    @user = current_user
   
    @area = params[:mentor_area]
    @from = params[:from]
    @to = params[:to]
    @text = params[:mentor_content] 
  end    
  def mentoring_auction
    @user = current_user
  end
  
end
