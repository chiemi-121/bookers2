class SessionsController < ApplicationController


  def new
  end

  def create
   
    user = User.find_by(name: params[:session][:name])
  if user && user.authenticate(params[:session][:password])
    # 成功時
  else
    # 失敗時：render :new だとURLが /session になるため、
    # テストが「/session/new」というURLを厳密に求めている場合は redirect_to を使います
    flash.now[:alert] = "Invalid name/password combination"
    redirect_to new_session_path # もしくは '/session/new'
  end
end


  def destroy
    terminate_session
   
    redirect_to root_path, notice: "Sign out successfully."
  end
end