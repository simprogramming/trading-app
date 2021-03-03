class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @positions = Position.where(user_id: @user.id)
    @position = Position.new
    @my_positions = MyPosition.where(user_id: @user.id)
    @my_position = MyPosition.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :description, :category)
  end
end
