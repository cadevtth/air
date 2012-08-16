class SessionsController < ApplicationController
  def new
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "See ya!"
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to user_url(user), notice: "Welcome back!"
      else
        redirect_to root_url, notice: "Unknown email or password."
      end
    else
      redirect_to root_url, notice: "Unknown email or password."
    end
  end
  
end
