class RealMentor < ActiveRecord::Base
  # 1:1  with user 
  belongs_to :user
  
  
    #M:N  mentor  & user & indexOfApply
  
  has_many :index_of_applies
  has_many :users, :through => :index_of_applies   

end
