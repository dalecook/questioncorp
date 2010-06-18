class Interview < ActiveRecord::Base

  has_many :answers

  validates_presence_of :name

end
