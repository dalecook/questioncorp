class InterviewsController < ApplicationController

  # GET /interviews/1
  # GET /interviews/1.xml
  def show
    @interview = Interview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /interviews/new
  # GET /interviews/new.xml
  def new
    @interview = Interview.new
    @questions = Question.active

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /interviews
  # POST /interviews.xml
  def create
    @interview = Interview.new(params[:interview])
    
    params[:questions].each_pair do |q, v|
        @interview.answers << Answer.new(:question_id => q.to_i, :answer => v)
    end
    
    respond_to do |format|
      if @interview.save
        format.html { redirect_to(@interview) }
      else
        @questions = Question.active
        format.html { render :action => "new" }
      end
    end
  end

end
