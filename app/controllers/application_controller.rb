class ApplicationController < ActionController::Base
  #login disabled for development purpose
  #before_filter :authenticate_user!, :except => [:index, :new, :edit, :show]
  
  protect_from_forgery
end
