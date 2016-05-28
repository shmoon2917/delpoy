class HomeController < ApplicationController
  before_action :require_login #login checking, 어플리케이션 컨트롤러 실행
  def index
<<<<<<< HEAD
    @user = current_user
=======
    @use = current_user
>>>>>>> 73c278fabd53d254a176cba2913de2d5fd8cfe41
  end
  
  def chat
  end
end
