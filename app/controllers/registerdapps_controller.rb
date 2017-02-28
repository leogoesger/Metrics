class RegisterdappsController < ApplicationController
  before_action :require_sign_in

  def index
    @apps = Application.all
  end

  def show
    @app = Application.find(params[:id])
  end

  def new
    @app = Application.new
  end

  def create
  end

  def update
  end

  def delete
    @app = Application.find(params[:id])

    if @app.destroy
      flash[:notice] = "\"#{@app.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the Application."
      render :show
    end

  end
end
