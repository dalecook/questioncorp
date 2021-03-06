class Interview < ActiveRecord::Base

  has_many :answers

  validates_presence_of :name

  after_create :notify_users

  #since the CEO is a big beliver in colaboration, add comments to the interviews so that company employees
  #can comment on the answers
  acts_as_commentable

  #get an interview and retrieve all the answers, ordered 
  def self.find_with_answers(id)
    self.find id, :include => [{:answers => :question}], :order => "questions.id ASC"
  end

private

  #after the interview is complete we'll send an email to each of the users notifying them that the 
  #interview is complete and they can now comment on it
  def notify_users
    Notification.deliver_interview_complete(User.find(:all).map {|u| u.email unless u.email.blank?}, self)
  end

end
