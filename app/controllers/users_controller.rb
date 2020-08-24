class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  before_action :correct_user, only: [:edit, :update]

	def top
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @book = Book.new

  end

  def about
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

def correct_user
  if params[:id].to_i != current_user.id
    redirect_to user_path(current_user)
  end
    # redirect_to(user_url) unless @user == current_user
end

end
