class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      cookies[:name] = @user.name
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid name'
      render :new
    end
  end
end
