class User < ActiveRecord::Base
  # 1:1 with Mentor 
  has_one :real_mentor
  
  # 1: N  with applyListDetails
  
  has_many :apply_list_details

  # N:M  user & mentor through indexOfApply
  
  has_many :index_of_applies
  has_many :real_mentors, :through => :index_of_applies
  



  has_many :post

  mount_uploader :user_img_url, SanghoUploader


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,

         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  def self.find_for_oauth(auth, signed_in_resource = nil)

    # user와 identity가 nil이 아니라면 받는다
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    # user가 nil이라면 새로 만든다.
    if user.nil?

      # 이미 있는 이메일인지 확인한다.
      email = auth.info.email
      user = User.where(:email => email).first
      unless self.where(email: auth.info.email).exists?

        # 없다면 새로운 데이터를 생성한다.
        if user.nil?
          user = User.new(
              name: auth.info.name,
              email: auth.info.email,
              password: Devise.friendly_token[0,20]
          )

          user.save!
        end

      end

    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user

  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
      
      
        

  has_many :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :user_img_url, SanghoUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
