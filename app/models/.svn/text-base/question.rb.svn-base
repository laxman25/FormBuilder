class Question < ActiveRecord::Base
  belongs_to  :test
  has_many  :answers
  # has_many :responses
 has_and_belongs_to_many :responses
  

validates :question,:type_of_question, :presence => true
 
end
