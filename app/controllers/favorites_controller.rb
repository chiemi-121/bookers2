class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    render turbo_stream: turbo_stream.replace("favorite_btn_#{@book.id}", partial: "favorites/btn", locals: { book: @book })
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy if favorite
    render turbo_stream: turbo_stream.replace("favorite_btn_#{@book.id}", partial: "favorites/btn", locals: { book: @book })
  end
end