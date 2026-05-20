class BooksController < ApplicationController
  # 💡 本の一覧画面
  def index
    @books = Book.all
    @book = Book.new
  end

  # 💡 本の新規投稿処理
  def create
    @book = Book.new(book_params)
    @book.user_id = Current.user.id
    
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      flash.now[:alert] = "Failed to create book. Please check the errors."
      render :index, status: :unprocessable_entity
    end
  end

  # 💡 本の詳細画面
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  # ✨【追加】本を編集する画面
  def edit
    @book = Book.find(params[:id])
  end

  # ✨【追加】本の更新処理
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #【追加】本の削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private

  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  #  【追加】他の人が投稿した本の編集・削除をブロック
  def correct_user
    @book = Book.find(params[:id])
    unless @book.user == Current.user
      redirect_to books_path
    end
  end

end