class VolunteersController < ApplicationController
  before_action :authenticate_user!, except: [:pub_register, :pub_confirm]
  def index
    if params[:term]
      @volunteers = Volunteer.search_for(params[:term])
    else
      @volunteers = Volunteer.all
    end
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
      flash[:success] = "<strong>#{@volunteer.full_name}</strong> was successfully added"
      redirect_to volunteers_path
    else
      flash.now[:warning] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.update_attributes(volunteer_params)
      flash[:success] = "<strong>#{@volunteer.full_name}</strong> was successfully updated"
      redirect_to volunteers_path
    else
      flash.now[:warning] = "Something went wrong"
      render 'edit'
    end
  end
  
  def pub_register
    @volunteer = Volunteer.new
    render layout: 'public'
  end

  def pub_confirm
    @volunteer = Volunteer.create(volunteer_params)
    if @volunteer.save
      #RegistrationMailer.volunteer_welcome(@vounteer.id).deliver_later
      render 'pages/confirm', layout: 'public' and return
    else
      render :pub_register, layout: 'public'
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
                                      :leader_id,
                                      :validated,
                                      :notes)
  end
end
