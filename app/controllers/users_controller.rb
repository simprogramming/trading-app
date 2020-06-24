class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @positions = Position.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

 def user_params
  params.require(:user).permit(:nickname, :description, :category)
 end
end
