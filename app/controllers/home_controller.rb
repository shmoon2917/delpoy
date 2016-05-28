class HomeController < ApplicationController
  before_action :require_login #login checking, 어플리케이션 컨트롤러 실행
  def index
    @use = current_user
  end
  
  def chat
  end
end
