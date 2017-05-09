class VolunteersController < ApplicationController
  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def destroy
    Volunteer.find(params[:id]).destroy
    flash[:success] = "Volunteer removed"
    redirect_to volunteers_path
  end
  
  def show
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
  
  def create
    @volunteer = Volunteer.create(volunteer_params)
    if @volunteer.save
      flash[:success] = "<strong>#{@volunteer.first_name} #{@volunteer.last_name}</strong> was successfully added"
      redirect_to volunteers_path
    else
      flash.now[:warning] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.update_attributes(volunteer_params)
      flash[:success] = "<strong>#{@volunteer.first_name} #{@volunteer.last_name}</strong> was successfully updated"
      redirect_to volunteers_path
    else
      flash.now[:warning] = "Something went wrong"
      render 'edit'
    end
  end
  

  private
  def volunteer_params
    params.require(:volunteer).permit(:first_name,
                                      :last_name,
                                      :email,
                                      :phone,
                                      :notes,
                                      :leader_type,
                                      :leader_id)
  end
end
