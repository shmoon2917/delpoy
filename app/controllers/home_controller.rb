class HomeController < ApplicationController
  before_action :require_login #login checking, 어플리케이션 컨트롤러 실행
  def index
    @user = current_user
    @region = Region.all
  end
  def service
    @user = current_user
  end

  def mypage
    @user = current_user
    @post=ApplyListDetail.all
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
    redirect_to '/admin_apply'
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
    destroy_mentor.grade = 0
    destroy_mentor.save
    redirect_to '/admin_mentor'
  end
  
  def checkout
    @user=current_user
    index=IndexOfApply.where(list_id: params[:list_id])
    detail=ApplyListDetail.find(params[:list_id])
    
        
    index.each do |i|
      if i.complete==2
        redirect_to :controller=>'home', :action=>'mentoring', :list_id => detail.id, :id=> i.id 
        return
      end
    end
    
    redirect_to :controller => 'home', :action => 'apply_status', :list_id => detail.id
  end

  def apply_status
    @user=current_user
    @index=IndexOfApply.where(list_id: params[:list_id])
    @details=ApplyListDetail.find(params[:list_id])
    @mentor=RealMentor.all
    @users=User.all
  end
  
  def mentor_select
    @user=current_user
    index=IndexOfApply.find(params[:index_of_id])
    index.complete=2
    
    index.save
    
    redirect_to '/mypage'
  end
  
  def mentoring
    @user=current_user
    @index=IndexOfApply.find(params[:id])
    @details=ApplyListDetail.find(params[:list_id])
    
    @mentor_id=RealMentor.find(@index.mentor_id)
    @mentor=User.find(@mentor_id.user_id)
    
  end
end
