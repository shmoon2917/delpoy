class MentoringController < ApplicationController
  def  mentoring_apply_form_1
    @user = current_user 
  end
  def  mentoring_apply_form_2
    @user = current_user 
  end  
  def need_mentor
    @user = current_user
    @area = params[:mentor_area]
    @from = params[:from]
    @to = params[:to]
    @text = params[:mentor_content]
  end

end
