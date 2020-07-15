class HotStocksController < ApplicationController

  before_action :set_hot_stock, only: [:destroy]

  def create
    @hot_stock = HotStock.new(hot_params)
    @hot_stock.user = current_user
    @hot_stock.save
    redirect_to my_watchlist_path
  end

  def destroy
    @hot_stock.destroy
    redirect_to dashboard_path
  end

private

  def hot_params
    params.require(:hot_stock).permit(:stock_id, :date, :direction)
  end

  def set_hot_stock
    @hot_stock = HotStock.find(params[:id])
  end
end
