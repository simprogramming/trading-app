class WatchedStocksController < ApplicationController

  def create
    @watched_stock = WatchedStock.new(watched_stock_params)
    @watched_stock.user = current_user
    stock = Stock.find_or_create_by(symbol: watched_stock_params[:symbol])
    @watched_stock.stock = stock
    authorize(@watched_stock)
    @users = User.all
    @positions = Position.all
    @watched_stocks = WatchedStock.all
    if @watched_stock.save
      @watched_stocks = WatchedStock.all
      render 'pages/profile'
    else
      render 'pages/profile'
    end
  end

  def destroy
  end

  private

  def watched_stock_params
    params.require(:watched_stock).permit(:symbol, :category)
  end
end
