class HomeController < ApplicationController
  before_action :require_login #login checking, 어플리케이션 컨트롤러 실행
  def index
    @user = current_user
  end
  
  def chat
  end
  
  def mypage
    @user = current_user
  end
  def enroll_mentor
  end
  
  def service
  end
end
