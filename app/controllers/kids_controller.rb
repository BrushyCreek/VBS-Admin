class KidsController < ApplicationController
  def index
    @kids = Kid.all
  end
  def new
    @kid = Kid.new
  end
  def create
    @kid = Kid.create(params[:kid])
    if @kid.save
      render "Kid"
    else
      render "new"
    end
  end
  def show
    @kid = Kid.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
  
end
