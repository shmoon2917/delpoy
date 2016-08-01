class MeetingController < ApplicationController
    
    def index
        @user = current_user
        @posts = Post.all
    end
      
    def register_meeting
        post = Post.new
        post.title = params[:title]
        post.about = params[:about]
        post.where = params[:where]
        post.region = params[:region]
        post.meet_time = params[:meet_time]
        post.content = params[:content]
        post.user = current_user
        post.total_num = params[:total_num]
        post.current_num = 0
        
        file = params[:pic]
        uploader = SanghoUploader.new
        uploader.store!(file)
        
        post.image_url = uploader.url
        post.save
        
        redirect_to "/meeting/index"
    end
      
    def meeting_detail
        @user = current_user
        @one_post = Post.find(params[:id])
    end
    
    def participate_in
        participate = Participate.new
        participate.post_id = params[:id_of_post]
        participate.name = params[:Add_name]
        
        num = params[:id_of_post]
        
        temp = Post.find(num)
        temp.current_num = temp.current_num + 1
        temp.save
        
        if participate.save
            redirect_to "/meeting/index"
        end
    end

end
