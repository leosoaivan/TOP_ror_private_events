class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(params[:name])
    cookies[:name] = @user.name
    redirect_to @user
  end
end
