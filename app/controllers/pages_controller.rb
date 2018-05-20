class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def info
    render layout: 'public'
  end

  def comming_soon
    render layout: 'public'
  end

  def confirm
    render layout: 'public'
  end
  
end
