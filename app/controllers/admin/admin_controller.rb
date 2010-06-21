class Admin::AdminController < ApplicationController
  
  #users must be logged in before they can access the admin features
  before_filter :require_user  
  
  #set the layout default to admin
  layout 'admin'
  
end