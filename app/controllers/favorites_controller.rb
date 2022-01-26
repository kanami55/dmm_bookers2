class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(book_id: params[:book_id])
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:id])
    @favorite = current_user.favorite.find_by(book_id: @book.id)
    @favorite.destroy
    redirect_to request.referer
  end
end
