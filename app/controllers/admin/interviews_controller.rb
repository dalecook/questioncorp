class Admin::InterviewsController < ApplicationController

  before_filter :require_user
  layout 'admin'
  
  # GET /interviews
  # GET /interviews.xml
  def index
    @interviews = Interview.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interviews }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.xml
  def show
    @interview = Interview.find(params[:id], :include => [{:answers => :question}, :comments])
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interview }
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.xml
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to(interviews_url) }
      format.xml  { head :ok }
    end
  end
end
