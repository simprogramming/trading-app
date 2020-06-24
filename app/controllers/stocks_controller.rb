class StocksController < ApplicationController
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.create(stock_params)
    redirect_to dashboard_path
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
