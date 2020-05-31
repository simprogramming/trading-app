class PagesController < ApplicationController
  def home
  end

  def my_watchlist
  end

  def profile
    @user = current_user
    @positions = Position.where(user_id: current_user.id)
  end

  def scoreboard
    @positions = Position.all
  end

  def dashboard

    # @stocks = ['AMZN','AAPL','NFLX', 'BA', 'BABA']
    @position = Position.new


  end
end
