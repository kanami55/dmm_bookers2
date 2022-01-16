class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book.id)
  else
      @books = Book.all
      flash[:notice] = "errors"
      render :index
  end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @books = Book.find(params[:id])
    @book = Book.new
  end

  def edit
    @books = Book.find(params[:id])
  end

  def destroy
    flash[:notice] = "Book was successfully destroyed"
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully destroyed."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
