class Quizz < ActiveRecord::Base
  validates_presence_of :question, :ans1, :ans2, :ans3
  validates_numericality_of :correctAns
end
