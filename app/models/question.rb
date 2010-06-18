class Question < ActiveRecord::Base

  belongs_to :user
 
  named_scope :active, :conditions => {:active => true}

  attr_protected :user, :active

  validates_presence_of :question, :user_id
  
end
