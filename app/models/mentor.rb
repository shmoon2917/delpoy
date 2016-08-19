class Mentor < ActiveRecord::Base

  #M:N  mentor  & user & indexOfApply
  
  has_many :index_of_applies
  has_many :users, :through => :index_of_applies   

end
