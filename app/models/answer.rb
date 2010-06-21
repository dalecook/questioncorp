class Answer < ActiveRecord::Base

  #an answer belongs to an interview and also a question
  belongs_to :question
  belongs_to :interview
  
end
