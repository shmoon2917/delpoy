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


    @a.title = params[:title]
    @a.mentor_area  = params[:mentor_area]
    @a.from = params[:from]
    @a.to = params[:to]
    @a.numOfMem = params[:numOfMem]
    @a.themeOfPlan = params[:theme]
    @a.accomodation = params[:accomodation]
    @a.budget = params[:budget]
    @a.mentor_content = params[:mentor_content]
    @a.complete = 0    
    @a.save

    # 1:1 관계에 있는 유저 : 멘토에서 멘토의 지역을 통해 유저(멘토)의 이름을 가져오기. -> 멘토들 이름 리스트로 뽑아내기

    u = User.where('grade = 2')
    cnt = 0;
    @mentor_name = []
    for i in 0..(u.length-1)
      cnt += 1
      if u[i].real_mentor.area == @a.mentor_area
        @mentor_name.push(u[i].username)
      end
    end

    # m = RealMentor.all
    # cnt = 0;
    # m.each do |men|
    #   if men.area == @a.mentor_area
    #
    #   end
    # end


    # m = RealMentor.all
    # cnt = 0 ;
    # m.each do |men|
    #   if men.area == @a.mentor_area
    #     i =IndexOfApply.new
    #     i.user_id = params[:id_of_user]
    #     i.mentor_id = men.id
    #     i.list_id = @a.id  # 현재 user의 1:N관계에 있는 list의 몇번째 idx에 있을까요
    #     i.complete=0 #아무것도 아닌 상태이니까 0으로 우선 주어 줌
    #
    #     cnt +=1
    #     i.save
    #   end
    # end
    if @cnt == 0
      # 해당하는 멘토가 한명도 없을 때 ,예외 처리
    end
    
    # 그담에 알림 해야함

  end

  def matching1
    @user = current_user
    @a = params[:chk_info]

    # 선택한 멘토들의 정보가 indexOfapply 에 담기며 M : N 관계가 형성.

    for i in 0..(@a.length-1)
      u = User.find_by username: @a[i]

      i = IndexOfApply.new
      i.user_id = params[:id_of_user]
      i.mentor_id = u.real_mentor.id
      i.list_id = params[:id_of_applylist]
      i.complete = 0

      i.save
    end

    redirect_to :controller => 'home', :action => 'apply_status', :list_id => i.list_id
  end


  def mentoring_auction
    @user = current_user
  end

  def mentor_view
    @user = current_user
    @mentor=RealMentor.find_by(user_id: @user.id)
    
    @find_my_apply= IndexOfApply.all
    @all_user=User.all
    
    @myindex_a=IndexOfApply.where(mentor_id: @mentor.id)
    @myindex=@myindex_a.where.not(complete: 3)
    
    @mentoring=@myindex.where(complete: 2)
    @detail=ApplyListDetail.where.not(complete: 2)
  end
  
  def mentor_viewdetail
    @user = current_user
    # @index_id=params[:index_id]
    
    @index=IndexOfApply.find_by(id: params[:index_id])
    @details = ApplyListDetail.find(params[:list_id])
    @mentee=User.find(@details.user_id)
  end
  
  def reply_admit
    @user = current_user
    @list_id = params[:list_id]
    @index_id=params[:index_id]
    # myindex = IndexOfApply.find_by(list_id: params[:list_id])
    # myindex.complete=1
    
    # myindex.save
  end
  
  def reply_admit2
    @user=current_user
    @list_id = params[:list_id]
    @index_id=params[:index_id]
    
    myindex = IndexOfApply.find_by(id: @index_id)
    myindex.complete=1
    myindex.auction_price=params[:cost]
    myindex.save
    
    
    # redirect_to '/mentor_view/apply_success?result=0'
    redirect_to :controller => 'mentoring', :action => 'reply_success', :result => 0, :list_id => myindex.list_id
    #해당 indexofapply의 list_id까지 보내주기 위한 redirect_to         
  end
  
  def reply_reject
    @user=current_user
    @list_id=params[:list_id]
    @index_id=params[:index_id]
    
    myindex=IndexOfApply.find_by(id: params[:index_id])
    myindex.complete=3  #멘토링 거절시 compelte=>3으로
    
    myindex.save
    
    # redirect_to '/mentor_view/apply_success?result=1'
    redirect_to :controller => 'mentoring', :action => 'reply_success', :result => 1, :list_id => myindex.list_id
    #해당 indexofapply의 list_id까지 보내주기 위한 redirect_to

  end
  
  def reply_success
    @user = current_user
    @list_id=params[:list_id]
    @result=params[:result]
    @details = ApplyListDetail.find(params[:list_id])
    @mentee=User.find(@details.user_id)
  end
  
  def show
    #멘토링 신청 폼(db) 확인하기위한 page
    @user=current_user
    @index=IndexOfApply.all
    @detail=ApplyListDetail.all
    @mentor=RealMentor.all
  end

  def mentoring_view
    @user = current_user
  end
end
