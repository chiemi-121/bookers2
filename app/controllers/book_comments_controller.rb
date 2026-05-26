class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_to book_path(book), notice: "Comment added successfully."
    else
      # エラー時の処理（詳細画面へ戻る）
      @book = book
      @book_comment = comment
      @new_book = Book.new
      @user = @book.user
      render "books/show", status: :unprocessable_entity
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id]), notice: "Comment deleted successfully."
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

