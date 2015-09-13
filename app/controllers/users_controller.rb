# encoding: UTF-8
class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'Данный пользователя успешно обновлены.'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name)
  end
end
