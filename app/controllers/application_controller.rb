class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :except => [:index, :new, :edit, :show]
  protect_from_forgery
end
