class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      # 失敗した場合は入力内容を保持して編集画面を再表示
      render :edit
    end
  end

  private

 def ensure_correct_user
    # URLのユーザーID（params[:id]）をUserとして検索
    @user = User.find(params[:id])
    
    # ログインユーザーのidと比較して、一致しなければリダイレクト
    unless @user.id == current_user.id
      redirect_to books_path # 本人の画面以外なら投稿一覧へリダイレクト
    end
  end
end