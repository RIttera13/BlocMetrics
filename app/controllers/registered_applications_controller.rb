class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.new(application_params)

    if @registered_application.save
      redirect_to users_show_path(current_user), notice: "Application was saved successfully."
    else
      flash.now[:alert] = "Error adding Application. Please try again."
      render :new
    end
  end

  def edit
     @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(application_params)

    if @registered_application.save
      flash[:notice] = "Application was updated."
      redirect_to users_show_path(current_user)
    else
      flash.now[:alert] = "There was an error saving the Application. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to users_show_path(current_user)
    else
      flash.now[:alert] = "There was an error deleting the Application."
      render :show
    end
  end
  private

  def application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
