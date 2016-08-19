class HomeController < ApplicationController
  before_action :require_login #login checking, 어플리케이션 컨트롤러 실행
  def index
    @user = current_user
    @region = Region.all
  end
  def service
    @user = current_user
  end
  def chat
  end
  
  def mypage
    @user = current_user
  end
  def enroll_mentor
    @user = current_user
  end
  def help
    @user = current_user
  end
  def enroll_process
    
    mentor = Mentor.new
    mentor.area = params[:mentor_area]
    mentor.period = params[:mentor_period]
    mentor.content = params[:mentor_content]
    mentor.personal_id = current_user.id
    mentor.save
    
    redirect_to '/'
  end
  def admin
    @mentor_request = Mentor.all
  end

  def admit
    admit_request = User.find_by(id: params[:hidden_personal_id])    # mentor db 상의 저장된 user_id를 이용해 User 를 찾음 
    r = RealMentor.new                                               # 새 멘토 생성
    r.area = params[:area]
    r.user_id = admit_request.id
    admit_request.real_mentor = r                                    #1:1 관계 형성시켜주기 
    admit_request.grade = 2                                          #유저 상의 등급 grade up ! 
    admit_request.region = params[:area]                             # 지역 업데이트 !
    
    admit_request.save
    
    request_destroy = Mentor.find_by(personal_id: params[:hidden_personal_id])
    request_destroy.destroy
    redirect_to '/'
  end
  def search_list
    @user = current_user
    @region = Region.all
    
    @user_region = params[:region]
    @all_users = User.all
  end
  
  def mentor_page
    @one_post = User.find(params[:id])
  end

  def need_mentor
    @area = params[:mentor_area]
    @from = params[:from]
    @to = params[:to]
    @text = params[:mentor_content]
    
    
  end

  
  def admin_index  
  end
  
  def admin_all
    @all_users = User.all
  end
      
  def admin_mentor
    @all_mentors=User.all
  end
  
  def admin_apply
    @mentor_request = Mentor.all
  end
  
  def admin_destroy
    destroy_user=User.find(params[:id])
    destroy_user.destroy
    redirect_to '/admin_all'
  end
  
  def down_grade
    destroy_mentor = User.find(params[:id])
    destroy_mentor.grade = 1
    destroy_mentor.save
    redirect_to '/admin_mentor'
  end


end
