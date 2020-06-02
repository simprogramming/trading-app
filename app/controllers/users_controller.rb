class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @positions = Position.where(user_id: @user.id)
  end


end
