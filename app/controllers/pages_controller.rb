class PagesController < ApplicationController
  def home
  end

  def my_watchlist
    @hot_stock = HotStock.new
  end


  def scoreboard
    @user = current_user
    @users = User.all
    @positions = Position.where(user_id: current_user.id)
    @all_positions = Position.all
  end

  def dashboard
    @hot_stocks = HotStock.all
    @derivatives = Derivative.all
  end
end
