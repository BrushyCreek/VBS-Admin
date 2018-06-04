class FamilyKidsController < ApplicationController
  
  def register
    # This should be used if a parent has already registered and needs to add a kid
    fam = Family.find(params[:family_id])
    @kid = fam.kids.build

    render layout: "public"
  end

  def confirm
    @kid = Kid.create(kid_params)
    if @kid.save
      @family = @kid.family
      render 'pages/confirm', layout: 'public'
    else
      render :register, layout: 'public'
    end
  end

  private
  
  def kid_params
    params.require(:kid).permit(:first_name,
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
                                :family_id,
                                :special_circumstance,
                                :term,
                                :grade)
  end 
end
