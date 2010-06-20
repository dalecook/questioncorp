class Notification < ActionMailer::Base

  def interview_complete(send_to, interview)
    
    #this will notify Questions Corp. users that an interview has been completed
    #this could be built out to be more complete, maybe only some users get emails, 
    #maybe more information about the interview is included
    
    recipients send_to
    subject    "#{interview.name} has completed their interview"
    from       "no_reply@questionscorp.com"
    body       :interview => interview
  
  end
  
end
