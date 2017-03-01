class EventsController < ApplicationController
  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@registerdapp = Registerdapp.find(params[:id])
  	@event = Event.new
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def create
  	 @registerdapp = Registerdapp.find(params[:id])
  	 @event = Event.new

   end

   private
 
   def event_params
     params.require(:event).permit(:name)
   end
end
