class User::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
before_action :configure_permitted_parameters

protected
def configure_permitted_parameters
  #added_attrs = [:user_img_url,:language,:grade, :region, :phone, :gender,:username, :email, :password, :password_confirmation, :remember_me]
  devise_parameter_sanitizer.for(:sign_up).push(:user_img_url,:language,:grade, :region, :phone, :gender,:username, :email, :password, :password_confirmation, :remember_me)
  devise_parameter_sanitizer.for(:account_update).push(:user_img_url,:language,:grade, :region, :phone, :gender,:username, :email, :password, :password_confirmation, :remember_me)
end
 
# private
#     # Never trust parameters from the scary internet, only allow the white list through.
#     def user_params
#       params.require(:user).permit(:image)
#     end

# public
  # GET /resource/sign_up
  # def new
  #   super
    
    # file = params[:image]
    # uploader = PictureUploader.new
    # uploader.store!(file)
        
    # resource.user_img_url = uploader.url
    # resource.save
     
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
