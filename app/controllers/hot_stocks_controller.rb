class HotStocksController < ApplicationController
  def create
    @hot_stock = HotStock.new(hot_params)
    @hot_stock.user = current_user
    @hot_stock.save
    redirect_to my_watchlist_path
  end

  def destroy
  end

private
  def hot_params
    params.require(:hot_stock).permit(:stock_id, :date, :direction)
  end
end
