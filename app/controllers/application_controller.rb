class ApplicationController < ActionController::Base
  #login disabled for development purpose
  #before_filter :authenticate_user!, :except => [:index, :new, :edit, :show]
  #protect_from_forgery
  before_filter :auth_message
  def auth_message
    @secure = "Authentication disabled for development purposes"
  end

end
