class Mentor < ActiveRecord::Base
  has_many :mentoring_applies
  has_many :users, through: :mentoring_applies
end
