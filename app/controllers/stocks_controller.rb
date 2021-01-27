class StocksController < ApplicationController

  before_action :set_stock, only: [:destroy]

  def new
    @stock = Stock.new
    tech = Stock.where(category: 'Technology')
    @tech_stocks = HotStock.where(stock_id: tech)
    finance = Stock.where(category: 'Financial')
    @financial_stocks = HotStock.where(stock_id: finance)
    real_estate = Stock.where(category: 'Real Estate')
    @real_estate_stocks = HotStock.where(stock_id: real_estate)
    telecom = Stock.where(category: 'Telecommunication')
    @telecom_stocks = HotStock.where(stock_id: telecom)
    healthcare = Stock.where(category: 'Healthcare')
    @health_care_stocks = HotStock.where(stock_id: healthcare)
    discretionary = Stock.where(category: 'Discretionary')
    @discretionary_stocks = HotStock.where(stock_id: discretionary)
    staple = Stock.where(category: 'Staple')
    @staple_stocks = HotStock.where(stock_id: staple)
    utilities = Stock.where(category: 'Utilities')
    @utilities_stocks = HotStock.where(stock_id: utilities)
    energy = Stock.where(category: 'Energy')
    @energy_stocks = HotStock.where(stock_id: energy)
    basic_material = Stock.where(category: 'Basic Material')
    @basic_material_stocks = HotStock.where(stock_id: basic_material)
    industrial = Stock.where(category: 'Industrial')
    @industrial_stocks = HotStock.where(stock_id: industrial)
    others = Stock.where(category: 'Others')
    @other_stocks = HotStock.where(stock_id: others)
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to new_stock_path
      flash[:notice] = 'New stock added to database'
    else
      redirect_to new_stock_path
      flash[:notice] = 'it didnt work'
    end
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
    redirect_to new_stock_path
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol, :category, :name, :grade)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
