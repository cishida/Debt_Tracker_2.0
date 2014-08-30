class HomeController < ApplicationController
	layout 'application'
  def index
  	if user_signed_in?
  		redirect_to({:controller => 'home', :action => 'signed_in'})
  	end
  end

  def signed_in

  end
end
