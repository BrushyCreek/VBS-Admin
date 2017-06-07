
class GroupsController < ApplicationController
  def index
    # @unassigned_kids = Kid.where(group_id: nil).find_each
    @unassigned_kids = Kid.where(group_id: nil).all
    @groups = Group.all

    respond_to do |format|
      format.html
      format.pdf
      format.xls { response.headers["Content-Disposition"] = "attachment; filename=\"Classes.xml\"" }
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      flash[:success] = "<strong>#{@group.name}</strong> created."
      redirect_to groups_path
    else
      flash.now[:warning] = "somthing went wrong"
      render 'new'
    end
  end

  def edit
   @group = Group.find(params[:id])   
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "<strong>#{@group.name}</strong> was successfully updated"
      redirect_to groups_path
    else
      flash.now[:warning] = "somthing went wrong"
      render 'edit'
    end
  end

  def update_kid_assignment #this action is from groups index it should only be called by an ajax request
    #@kid = Kid.find(params[:id])
    # @group = Group.find(params[:group_id])
    @group = Group.find(params[:id])
    
    if Kid.update(params[:kid_id], group_id: params[:id])
      # this should render the update_kid_assignment.js.erb file
    else
      render 'update_kid_assignment_error'
    end
  end

  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Class removed"
    redirect_to groups_path
  end
end

private

def group_params
  params.require(:group).permit(:name, :grade_id)
end
