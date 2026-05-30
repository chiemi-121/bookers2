class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.new(book_comment_params)
    @comment.user_id = current_user.id # ← ここが必須！
    @comment.save
  end

  def destroy
  @book = Book.find(params[:book_id])
  # 削除対象を特定
  @book_comment = @book.book_comments.find(params[:id])
  # 削除する前にIDだけ変数に入れておく
  @comment_id = @book_comment.id
  @book_comment.destroy
  # @book_comment はここで消滅して nil になるので、@comment_id を使う
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end