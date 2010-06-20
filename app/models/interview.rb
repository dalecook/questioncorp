class Interview < ActiveRecord::Base

  has_many :answers

  validates_presence_of :name

  after_create :notify_users

  acts_as_commentable

private

  #after the interview is complete we'll send an email to each of the users notifying them that the 
  #interview is complete and they can now comment on it
  def notify_users
    Notification.deliver_interview_complete(User.find(:all).map {|u| u.email unless u.email.blank?}, self)
  end

end
