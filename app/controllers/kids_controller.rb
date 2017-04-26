class KidsController < ApplicationController
  def index
    @kids = Kid.all
  end
  def new
    @kid = Kid.new
  end
  def create
    @kid = Kid.create(kid_params)
    if @kid.save
      flash[:success] = "Child was successfully regiesterd"
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
                                :parent_first_name,
                                :parent_last_name,
                                :parent_email,
                                :parent_phone,
                                :church_member,
                                :invited_by,
                                :tshirt_size_id,
                                :allergies,
                                :allergies_notes,
                                :midical_issues,
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
                                :can_photograph)
  end
end
