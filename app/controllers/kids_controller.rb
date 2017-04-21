class KidsController < ApplicationController
  def index
    @kids = Kid.all
  end
  def new
  end
end
