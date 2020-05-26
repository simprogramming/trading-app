class PagesController < ApplicationController
  def home
  end

  def my_watchlist
  end

  def profile
    @positions = Position.all
  end

  def scoreboard
  end

  def dashboard

    # @stocks = ['AMZN','AAPL','NFLX', 'BA', 'BABA']
    @position = Position.new



  end
end
