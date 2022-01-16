class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
  if @user.save
     flash[:notice] = "successfully."
     redirect_to user_path(@user.id)
  else
    render :top
  end
  end

  def show
    @user = User.new
    @users = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
end
