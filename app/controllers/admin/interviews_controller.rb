class Admin::InterviewsController < Admin::AdminController
  
  def index
    @interviews = Interview.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @interview = Interview.find_with_answers(params[:id])
    @comments = @interview.comments_ordered_by_submitted
    @comment = Comment.new
    
    respond_to do |format|
      format.html
    end
  end

  def destroy
    Interview.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to(admin_interviews_url) }
    end
  end
end
