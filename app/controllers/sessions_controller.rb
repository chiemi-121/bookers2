class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    if user = User.authenticate_by(name: params[:name], password: params[:password])
      start_new_session_for user
      redirect_to root_path, notice: "Signed in successfully."
    else
      # 失敗時はアラートを出してログイン画面を再表示
      flash.now[:alert] = "Invalid name or password.（error）"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
