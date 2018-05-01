class GuardiansController < ApplicationController

  private
  
  def guardian_params
    params.require(:guardian).permit(:first_name,
                                     :last_name,
                                     :phone,
                                     :email,
                                     :family_id,
                                     :term)
  end 
end
