# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

  ceo_user = User.new(:login => "bobceo", :password => "igotquestions", :password_confirmation => "igotquestions", :email => "ceo@questionscorp.com")
  ceo_user.save
  dave_user = User.new(:login => "daveadmin", :password => "heyitsdave", :password_confirmation => "heyitsdave", :email => "dave@questionscorp.com")
  dave_user.save
  User.create(:login => "justinintern", :password => "justhangin", :password_confirmation => "justhangin", :email => "justin@questionscorp.com")

  skydive_q = ceo_user.questions.new(:question => "Have you ever gone skydiving before?")
  skydive_q.save
  month_q = ceo_user.questions.new(:question => "What's your favorite month?")
  month_q.save
  company_q = ceo_user.questions.new(:question => "What would you name your own company?")
  company_q.save
  
  interview = Interview.new(:name => "Grebo Bloggins")
  interview.answers << Answer.new(:question_id => skydive_q.id, :answer => "Once, with my grandma")
  interview.answers << Answer.new(:question_id => month_q.id, :answer => "January, because of the birds")
  interview.answers << Answer.new(:question_id => company_q.id, :answer => "Questions Corporation 2")
  
  interview.comments << Comment.new(:comment => "I think I like this guy, he's a little nutty but very creative.", :user_id => ceo_user.id)
  interview.comments << Comment.new(:comment => "I don't know, creative is one thing, but this is a little loopy.", :user_id => dave_user.id)
  
  interview.save
  