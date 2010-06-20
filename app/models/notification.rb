class Notification < ActionMailer::Base

  def interview_complete(send_to, interview)
    
    #this will notify Questions Corp. users that an interview has been completed
    
    recipients send_to
    subject    "#{interview.name} has completed their interview"
    from       "no_reply@questionscorp.com"
    body       :interview => interview
  
  end
  
end
