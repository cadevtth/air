class SessionsController < ApplicationController
  def new
  end

  # CHALLENGE:
  # Let a user sign up, sign in, and sign out
  # Make the navigation bar change appropriately
  # Display the user's name if signed in
  
  def destroy
    session["user_id"] = nil
    redirect_to root_url, notice: "See ya!"
  end
  
  # {"utf8"=>"✓", "authenticity_token"=>"eNgQX+OA9VcETju4HS0+YjO6/RwbjpnHfBuCETQUhVw=", "email"=>"jeff@codeacademy.org", "password"=>"[FILTERED]", "commit"=>"Let Me In!"}
  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        redirect_to root_url, notice: "Unknown email or password."
      end
    else
      redirect_to root_url, notice: "Unknown email or password."
    end
  end
end
