class Admin::QuestionsController < ApplicationController

  before_filter :require_user
  layout 'admin'
  
  # GET /questions
  # GET /questions.xml
  def index
    @questions = Question.active
    @question = Question.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # POST /questions
  # POST /questions.xml
  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    @question.active = true

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(:admin, @question) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
    @question.update_attribute(:active, false)

    respond_to do |format|
      format.html { redirect_to(admin_questions_url) }
    end
  end

end
