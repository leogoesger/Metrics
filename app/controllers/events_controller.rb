class EventsController < ApplicationController
  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@registerdapp = Registerdapp.find(params[:registerdapp_id])
  	@event = Event.new
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def create
  	 @registerdapp = Registerdapp.find(params[:registerdapp_id])
  	 @event = @registerdapp.events.build(event_params)

     if @event.save
      flash[:notice] = "Event was saved!"
      redirect_to [@registerdapp, @event]
     else
      flash[:alert] = "There was an error saving the Event!"
      redirect_to :new
     end
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end
