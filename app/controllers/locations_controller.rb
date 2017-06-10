class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @unassigned_leaders = Volunteer.where(leader_type: "Location").where(leader_id: nil).all
  end

  def new
    @location = Location.new    
  end

  def create
    @location = Location.create(location_params)
    if @location.save
      flash[:success] = "<strong>#{@location.name}</strong> created."
      redirect_to locations_path
    else
      flash.now[:warning] = "somthing went wrong"
      render 'new'
    end
  end

    def edit
   @location = Location.find(params[:id])   
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "<strong>#{@location.name}</strong> was successfully updated"
      redirect_to location_path
    else
      flash.now[:warning] = "somthing went wrong"
      render 'edit'
    end
  end

    def update_volunteer_assignment #this action is from groups index it should only be called by an ajax request
    @location = Location.find(params[:id])
    
    if Volunteer.update(params[:volunteer_id], leader_id: params[:id])
    # this should render the update_volunter_assignment.js.erb file
    else
      render 'update_volunteer_assignment_error'
    end
  end


  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Class removed"
    redirect_to locations_path
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
