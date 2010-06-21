class Admin::QuestionsController < Admin::AdminController
  
  def index
    
    @questions = Question.active

    #this is for the new question form on the index page
    @question = Question.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @question = Question.new(params[:question])
    
    #user and active cannot be set by mass assignment so set them here
    @question.user = current_user
    @question.active = true

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(admin_questions_url) }
      else
        format.html { render :action => "index" }
      end
    end
  end

  def destroy
    
    #since questions are directly associated with answers the questions should never be removed from the 
    #database, since then answers will no longer have a question, instead make them inactive 
    
    @question = Question.find(params[:id])
    @question.inactivate!

    respond_to do |format|
      format.html { redirect_to(admin_questions_url) }
    end
  end

end
