class EventsController < ApplicationController
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
  
end
