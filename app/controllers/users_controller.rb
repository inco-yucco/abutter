class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @icons = Icon.all
    @icon = @icons.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to @user, notice: "更新しました"
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :birthday, :introduction, :icon)
  end
end
