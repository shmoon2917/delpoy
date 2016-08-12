class MentoringApply < ActiveRecord::Base
  belongs_to :mentor
  belongs_to :user
end
