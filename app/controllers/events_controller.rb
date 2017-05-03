class EventsController < ApplicationController
  def new
    @event = Event.new
  end
    
  def create
    @user = User.find_by(name: cookies[:name])
    @event = @user.created_events.build(params[:name])
    @event.save
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end
end
