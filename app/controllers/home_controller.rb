class HomeController < ApplicationController
  before_action :require_login #login checking, 어플리케이션 컨트롤러 실행
  def index
    @user = current_user
    @region = Region.all
  end
  
  def chat
  end
  
  def mypage
    @user = current_user
  end
  def enroll_mentor
    
  end
  def enroll_process
    mentor = Mentor.new
    mentor.area = params[:mentor_area]
    mentor.period = params[:mentor_period]
    mentor.content = params[:mentor_content]
    mentor.save
    
    redirect_to '/'
  end
  def admin
    @mentor_request = Mentor.all
  end
end
