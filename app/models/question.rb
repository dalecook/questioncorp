class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers
 
  #generally we're only interested in active questions
  named_scope :active, :conditions => {:active => true}

  #should not be able to set user and active flag by mass assignment
  attr_protected :user, :active

  #must have an actual question and a user
  validates_presence_of :question, :user_id

  def inactivate!
    update_attribute(:active, false)    
  end
  
end
