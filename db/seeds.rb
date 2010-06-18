# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

  ceo_user = User.new(:login => "bobceo", :password => "igotquestions", :password_confirmation => "igotquestions")
  ceo_user.save  
  User.create(:login => "daveadmin", :password => "heyitsdave", :password_confirmation => "heyitsdave")
  User.create(:login => "billintern", :password => "justhangin", :password_confirmation => "justhangin")

  ceo_user.questions.new(:question => "Have you ever gone skydiving before?").save
  ceo_user.questions.new(:question => "What's your favorite month?").save
  ceo_user.questions.new(:question => "What would you name your own company?").save
  
