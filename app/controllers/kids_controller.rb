class KidsController < ApplicationController
  helper ApplicationHelper
  
  def index
    if params[:term]
      @kids = Kid.search_for(params[:term])
    else
      @kids = Kid.all
    end      
  end
  
  #These methods are for working with kids from the volunteer context
  def new
    @kid = Kid.new
  end
  
  def edit
    @kid = Kid.find(params[:id])
  end

  def destroy
    Kid.find(params[:id]).destroy
    flash[:success] = "Kid removed"
    redirect_to kids_path
  end
  
  def update
    @kid = Kid.find(params[:id])
    if @kid.update_attributes(kid_params)
      flash[:success] = "<strong>#{@kid.first_name} #{@kid.last_name}</strong> was successfuly updated"
      redirect_to kids_path
    else
      flash.now[:warning] = "Something went wrong"
      render 'edit'
    end
  end
  
  def create
    @kid = Kid.create(kid_params)
    if @kid.save
      flash[:success] = "<strong>#{@kid.first_name} #{@kid.last_name}</strong> was successfully registerd"
      redirect_to kids_path
    else
      flash.now[:warning] = "Something went wrong"
      render 'new'
    end
  end
  
  def show
    @kid = Kid.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
  #These methods are for working with kids from the registration perspective
  def register
    #Call render the fancy registration form
    @kid = Kid.new
    render layout: "public"
  end
  
  def confirm
    @kid = Kid.create(kid_params)
    if @kid.save
      render layout: "public"
    else
      flash.now[:warning] = "something went wrong"
      render 'register'
    end
  end
  private
  
  def kid_params
    params.require(:kid).permit(:first_name,
                                :last_name,
                                :birthdate,
                                :last_grade_id,
                                :gender,
                                :address,
                                :city,
                                :state,
                                :zipcode,
                                :parent_name,
                                :parent_email,
                                :parent_phone,
                                :church_member,
                                :invited_by,
                                :tshirt_size_id,
                                :allergies,
                                :allergies_notes,
                                :medical_issues,
                                :medical_issues_notes,
                                :buddy_request,
                                :notes,
                                :pickupper_1_name,
                                :pickupper_1_phone,
                                :pickupper_2_name,
                                :pickupper_2_phone,
                                :pickupper_3_name,
                                :pickupper_3_phone,
                                :highlight,
                                :can_photograph,
                                :group_id,
                                :term)
  end
end
