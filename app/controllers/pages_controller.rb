class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def info
    render layout: 'public'
  end
  
end
