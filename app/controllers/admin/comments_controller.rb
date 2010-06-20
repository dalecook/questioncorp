class Admin::CommentsController < ApplicationController

  before_filter :require_user


  # POST /questions
  # POST /questions.xml
  def create
    
    @interview = Interview.find(params[:interview_id])
    
    @comment = @interview.comments.new(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js
      else
        #need to send back an error to an error div or otherwise notify the user of a problem
      end
    end
  end
  
end
