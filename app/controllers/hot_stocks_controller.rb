class HotStocksController < ApplicationController

  before_action :set_hot_stock, only: [:destroy]

  def index
    @hot_stocks = HotStock.all
  end

  def create
    @hot_stock = HotStock.new(hot_params)
    @hot_stock.user = current_user
    respond_to do |format|
      if @hot_stock.save
        format.html { redirect_to my_watchlist_path, notice: 'Hot stock was successfully created.' }
        format.json { render :new, status: :created, location: @hot_stock }
      else
        format.html { redirect_to my_watchlist_path, notice: 'Incomplete action, try again' }
        format.json { render json: @hot_stock.errors, status: :unprocessable_entity }
      end
    end

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
