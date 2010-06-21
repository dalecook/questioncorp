class User < ActiveRecord::Base
  
  acts_as_authentic

  #questions are created by a user
  has_many :questions

end
