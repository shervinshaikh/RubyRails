class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    permitted_params = params.require(:event).permit(:name, :description, :location, :price, :starts_at)
    @event.update(permitted_params)
    redirect_to @event
  end
end
