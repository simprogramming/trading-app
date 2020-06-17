class StocksController < ApplicationController
  def new
    @stock = Stock.new
  end

  def create
    @stock = stock.new(stock_params)
    @stock.save
  end

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
