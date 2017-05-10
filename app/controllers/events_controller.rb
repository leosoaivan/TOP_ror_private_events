class EventsController < ApplicationController
  before_action :require_login, only: :create

  def new
    @event = Event.new
  end
    
  def create
    @user = User.find_by(name: cookies[:name])
    @event = @user.created_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      flash.now[:danger] = "Event name/date cannot be blank"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
  end

  private

    def event_params
      params.require(:event).permit(:name, :date)
    end

    def require_login
      unless logged_in?
        flash[:danger] = "You must be logged in to access this section"
        redirect_to login_url
      end
    end
  
end
