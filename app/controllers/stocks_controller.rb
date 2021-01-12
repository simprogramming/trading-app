class StocksController < ApplicationController

  before_action :set_stock, only: [:destroy]

  def new
    @stock = Stock.new
    @stocks = Stock.all
  end

  def create
    @stock = Stock.create(stock_params)
    redirect_to new_stock_path
    flash[:notice] = 'New stock added to database'
  end

  def import
    Stock.import(params[:file])
    redirect_to new_stock_path, notice: 'New stock added to database'
  end

  def destroy
    @stock.destroy
    redirect_to new_stock_path
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.update(stock_params)
    redirect_to root_path
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol, :category, :name, :grade)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
