class BooksController < ApplicationController

  def create
    @user = current_user
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
  if @new_book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@new_book)
  else
      @books = Book.all
      flash[:notice] = "errors"
      render :index
  end
  end

  def show
    @user = current_user
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def index
    @new_book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully destroyed."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Book was successfully destroyed."
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
