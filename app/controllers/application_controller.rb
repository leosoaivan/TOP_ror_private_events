class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !cookies[:name].nil?
  end
  
end
