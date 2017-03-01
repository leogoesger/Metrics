class RegisterdappsController < ApplicationController
  before_action :require_sign_in

  def index
    @registerdapps = Registerdapp.all
  end

  def show
    @registerdapp = Registerdapp.find(params[:id])
  end

  def new
    @registerdapp = Registerdapp.new
  end

  def edit
    @registerdapp = Registerdapp.find(params[:id])
  end

  def create
    @registerdapp = Registerdapp.new(registerdapps_params)

    if @registerdapp.save
       flash[:notice] = "registerdapplication was saved."
       redirect_to @registerdapp, notice: "Registerd application was saved successfully."
     else
       flash.now[:alert] = "There was an error saving the registerdapplication. Please try again."
       render :new
     end
  end

  def update
  end

  def destroy
    @registerdapp = Registerdapp.find(params[:id])

    if @registerdapp.destroy
      flash[:notice] = "\"#{@registerdapp.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the registerdapplication."
      render :show
    end
  end

  private
   def registerdapps_params
     params.require(:registerdapp).permit(:title, :body)
   end
end
