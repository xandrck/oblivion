class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:full_name)
    end

    def find_user
      @user = Full_name.where(id: params[:id]).first
    end
end

