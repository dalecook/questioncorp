class Question < ActiveRecord::Base

  #who created the question?
  belongs_to :user
 
  #generally we're only interested in active questions
  named_scope :active, :conditions => {:active => true}

  #should not be able to set user and active flag by mass assignment
  attr_protected :user, :active

  #must have an actual question and a user
  validates_presence_of :question, :user_id
  
end
