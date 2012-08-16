class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def require_login
    @user = User.find_by_id(session[:user_id])
    redirect_to root_url, notice: 'Please login.' unless @user
  end
  
  
end
