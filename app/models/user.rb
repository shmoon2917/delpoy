class User < ActiveRecord::Base
  has_many :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :user_img_url, SanghoUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   #M:N
  has_many :mentoring_applies
  has_many :mentors, through: :mentoring_applies         
end
