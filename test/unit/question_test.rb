require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test "minimal" do
    question = Question.new()
    assert_equal question.save, false, "A question object should always have a question to be saved, but it doesn't"

    question = Question.new(:question => "Did this question save?", :user => users(:bobceo))
    assert_equal question.save, false, "This question should have failed since users is set by mass assignment and that's not allowed"

    question = Question.new(:question => "Did this question save?", :active => false)
    question.user = users(:bobceo)
    assert_equal question.active, true, "This question should have active set to true, the default, even though the mass assigment set it to false, since mass assignment of active is not allowed"
    
    question = Question.new(:question => "Did this question save?")
    question.user = users(:bobceo)
    assert question.save, "This question should have been ok, it has the required fields"
   
  end

  test "active named scope" do
    
    #test that the active named scope only returns active questions
    
    all_questions = Question.find(:all)
    active_questions = Question.active
    
    assert_not_equal all_questions, active_questions, "There should be more questions than active questions"
    
    active_questions.each do |question|
      assert question.active, "The active property of #{question.question} should be true"
    end
    
  end

  test "inactivate" do
    
    questions(:question_one).inactivate!
    assert_equal questions(:question_one).active, false
    
  end

end
