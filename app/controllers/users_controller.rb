class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]

  # 新規登録画面（ログイン前）
  def new
    @user = User.new
  end

  # 新規登録の保存処理
  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to user_path(@user), notice: "Welcome! You have signed up successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # ユーザー一覧画面
  def index
    @users = User.all
    @book = Book.new
  end

  # ユーザー詳細画面（マイページ）
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  # ✨【追加】プロフィール編集画面
  def edit
    @user = User.find(params[:id])
  end

  # ✨【追加】プロフィールの更新処理
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  # 💡 ストロングパラメータを仕様に合わせて調整！
  def user_params
    # :name, :profile_image, :introduction を確実に許可します
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :introduction, :profile_image)
  end
end