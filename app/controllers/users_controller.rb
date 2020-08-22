class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!, except: [:top]

	def top
  end

  def show
    @books = Book.all
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def about
  end

  def create
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: "You have updated user successfully."
    else
      render :edit
    end
  end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

private
def correct_user
  user = User.find(params[:id])
  if current_user != user
    redirect_to root_path
  end
end
end
