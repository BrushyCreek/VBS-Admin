class FamilyGuardiansController < ApplicationController
  
  def add
    # this should be used if a parent has already registered and needs to add a kid
    fam = Family.find(params[:family_id])
    @g = fam.guardians.build
  end

  def create
    @g = Guardian.create(guardian_params)
    if @g.save
      @family = @g.family
      redirect_to families_path
    else
        flash.now[:warning] = "Somthing went wrong"
        render 'add'
    end
  end
  private
  
  def guardian_params
    params.require(:guardian).permit(:first_name,
                                     :last_name,
                                     :phone,
                                     :email,
                                     :family_id)
  end 

end

