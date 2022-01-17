class UsersController < ApplicationController
  def new
   @book = Book.new
  end

  def show
    @book = Book.new
    @users = User.find(params[:id])
    @books = @users.books
  end

  def new
    @user = User.new(user_params)
  if @user.save
    redirect_to user_path
  else
    render 'users/sign_up'
  end
  end

  def edit
    @user = User.find(params[:id])
  end


  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @book = Book.new
    @user.update(user_params)
    if @user.save
      flash[:notice] = "Book was successfully destroyed."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :get_profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
