class Mentor < ActiveRecord::Base
  #M:N  mentor  & user & indexOfApply
  
  has_many :indexOfApplies
  has_many :users, :through => :indexOfApplies   
end
