class PagesController < ApplicationController
  def home
  end

  def my_watchlist
    @hot_stock = HotStock.new
  end

  def profile
    @user = current_user
    @positions = Position.where(user_id: current_user.id)
  end

  def scoreboard
    @user = current_user
    @users = User.all
    @positions = Position.where(user_id: current_user.id)
    @all_positions = Position.all
  end

  def dashboard

    # @stocks = ['AMZN','AAPL','NFLX', 'BA', 'BABA']
    @position = Position.new
    @hot_stocks = HotStock.all


  end
end
