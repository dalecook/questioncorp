class InterviewsController < ApplicationController

  def show
    @interview = Interview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @interview = Interview.new

    #get all the currently active questions
    @questions = Question.active

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    
    @interview = Interview.new(params[:interview])
    
    #for each question, assign the answer submitted
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
