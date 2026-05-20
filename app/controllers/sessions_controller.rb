class SessionsController < ApplicationController


  allow_unauthenticated_access only: [ :new, :create ]

  def new
  end

  def create
   
    if user = User.authenticate_by(name: params[:name], password: params[:password])
      start_new_session_for user
  
      redirect_to user_path(user), notice: "Signed in successfully."
    else
  
      flash.now[:alert] = "Login error: Invalid name or password. Please try again."
      render :new, status: :unprocssable_entity
    end
  end


  def destroy
    terminate_session
   
    redirect_to root_path, notice: "Sign out successfully."
  end
end