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

    @a.mentor_area  = params[:mentor_area]
    @a.from = params[:from]
    @a.to = params[:to]
    @a.numOfMem = params[:numOfMem]
    @a.themeOfPlan = params[:themeOfPlan]
    @a.accomodation = params[:accomodation]
    @a.budget = params[:budget]
    @a.mentor_content = params[:mentor_content]
    @a.complete = 0    
    @a.save

    m = RealMentor.all
    cnt = 0 ;
    m.each do |men|
      if men.area == @a.mentor_area
        i =IndexOfApply.new
        i.user_id = params[:id_of_user]
        i.mentor_id = men.id
        i.list_id = @a.id  # 현재 user의 1:N관계에 있는 list의 몇번째 idx에 있을까요 
        i.complete=0 #아무것도 아닌 상태이니까 0으로 우선 주어 줌 
        
        cnt +=1
        i.save 
      end
    end
    if cnt == 0
      # 해당하는 멘토가 한명도 없을 때 ,예외 처리
    end
    
    # 그담에 알림 해야함

  end

  def mentoring_auction
    @user = current_user
  end

  def mentor_view
    @user = current_user
    @mentor=RealMentor.find_by(user_id: @user.id)
    
    @find_my_apply= IndexOfApply.all
    @all_user=User.all
    
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
end
