class UsersController < ApplicationController
  def new
   @book = Book.new
  end

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def new
    @user = User.new(user_params)
  if @user.save
    redirect_to user_path
  else
    render new_user_registration_path
  end
  end

  def index
    @users = User.all
    @new_book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @book = Book.new
    @user.update(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :get_profile_image)
  end
end
