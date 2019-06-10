class GuardiansController < ApplicationController

  def update
    @g = Guardian.find(params[:id])
    respond_to do | format |
      if @g.update_attributes(guardian_params)
        format.html {
          flash[:success] = "<strong>#{@g.first_name} #{@g.last_name}</strong> was successfuly updated"
          redirect_to families_path #family_path(@g.family_id)
        }
        format.js
      else
        format.html {
          flash.now[:warning] = "Something went wrong"
          render 'edit'
        }
      end
    end 
  end

  def edit
    @guardian = Guardian.find(params[:id])
  end

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
