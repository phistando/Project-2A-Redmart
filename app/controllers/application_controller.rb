class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

private

  def require_login
    #check if the user is logged in or not
    unless logged_in?
      store_location
      flash[:danger] = "Please log in to access"
      redirect_to root_url # halts request cycle
    end
  end

end
