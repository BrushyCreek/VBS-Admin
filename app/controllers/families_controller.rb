class FamiliesController < ApplicationController
  before_action :authenticate_user!, except: [:pub_register, :pub_confirm]

  def new
    @family = Family.new
    @family.kids.build
    @family.guardians.build(is_head: true)
    2.times { @family.guardians.build(is_head: false) }    
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to @family
    else
      flash[:warning] = "Somethig went wrong"
      render :new
    end
  end

  def search
    @fams = []
    if params[:term]
      guardians = Guardian.search_for(params[:term])
      guardians.each do |guardian|
        @fams << guardian.family
      end
    else
      @fams = Family.all
    end
    
  end

  def register
    @family = Family.new
    @family.kids.build
    @family.guardians.build(is_head: true)
    2.times { @family.guardians.build(is_head: false) }

    render layout: "public"
  end
  
  def confirm
    @family = Family.new(family_params)
    if @family.save
      redirect_to @family
    else
      render :new
    end

    render layout: "public"
  end

  def pub_register

    render layout: "public"
  end

  def pub_confirm

    render layout: "public"
  end


  private


  def family_params
    params.require(:family).permit(guardians_attributes: [:id,
                                                          :address,
                                                          :city,
                                                          :state,
                                                          :zipcode,
                                                          :first_name,
                                                          :last_name,
                                                          :phone,
                                                          :email,
                                                          :has_wristband,
                                                          :family_id,
                                                          :is_head,
                                                          :_destroy],
                                   kids_attributes: [:id,
                                                     :first_name,
                                                     :last_name,
                                                     :birthdate,
                                                     :last_grade_id,
                                                     :gender,
                                                     :church_member,
                                                     :invited_by,
                                                     :tshirt_size_id,
                                                     :allergies,
                                                     :allergies_notes,
                                                     :medical_issues,
                                                     :medical_issues_notes,
                                                     :buddy_request,
                                                     :notes,
                                                     :highlight,
                                                     :can_photograph,
                                                     :group_id,
                                                     :special_circumstance,
                                                     :_destroy])
  end 
end
