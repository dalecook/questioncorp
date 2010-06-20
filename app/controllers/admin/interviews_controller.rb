class Admin::InterviewsController < ApplicationController

  before_filter :require_user
  layout 'admin'
  
  # GET /interviews
  # GET /interviews.xml
  def index
    @interviews = Interview.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /interviews/1
  # GET /interviews/1.xml
  def show
    @interview = Interview.find(params[:id], :include => [{:answers => :question}])
    @comments = @interview.comments_ordered_by_submitted
    @comment = Comment.new
    
    respond_to do |format|
      format.html
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.xml
  def destroy
    Interview.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to(admin_interviews_url) }
    end
  end
end
