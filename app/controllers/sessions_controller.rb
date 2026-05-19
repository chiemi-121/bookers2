# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  # ログイン画面の表示とログイン処理は、未ログインでもアクセスできるように設定
  allow_unauthenticated_access only: [ :new, :create ]

  def new
  end

  def create
    # 💡 params[:name] を使って、ユーザー名とパスワードで認証します
    if user = User.authenticate_by(name: params[:name], password: params[:password])
      start_new_session_for user
      # 処理成功時のサクセスメッセージ（successfully を含める）
      redirect_to root_path, notice: "Sign in successfully."
    else
      # 処理失敗時のエラーメッセージ（error を含める）
      flash.now[:alert] = "Invalid name or password. (error)"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    # ログアウト成功時のサクセスメッセージ（successfully を含める）
    redirect_to root_path, notice: "Sign out successfully."
  end
end