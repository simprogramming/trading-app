class StocksController < ApplicationController

  before_action :set_stock, only: [:destroy]

  def new
    @stock = Stock.new
    @tech_stocks = Stock.where(category: 'Technology').order(grade: :asc, name: :asc)
    @financial_stocks = Stock.where(category: 'Financial').order(grade: :asc)
    @real_estate_stocks = Stock.where(category: 'Real Estate').order(grade: :asc)
    @telecom_stocks = Stock.where(category: 'Telecommunication').order(grade: :asc)
    @health_care_stocks = Stock.where(category: 'Healthcare').order(grade: :asc)
    @discretionary_stocks = Stock.where(category: 'Discretionary').order(grade: :asc)
    @staple_stocks = Stock.where(category: 'Staple').order(grade: :asc)
    @utilities_stocks = Stock.where(category: 'Utilities').order(grade: :asc)
    @energy_stocks = Stock.where(category: 'Energy').order(grade: :asc)
    @basic_material_stocks = Stock.where(category: 'Basic Material').order(grade: :asc)
    @industrial_stocks = Stock.where(category: 'Industrial').order(grade: :asc)
    @other_stocks = Stock.where(category: 'Others').order(grade: :asc)
  end

  def index
    @stocks = Stock.all
    @hot_stocks = HotStock.all
  end

  def create
    @stock = Stock.create(stock_params)
    flash[:notice] = 'New stock added to database'
    respond_to do |format|
      if @stock.save
        format.html { redirect_to my_watchlist_path, notice: 'stock was successfully created.' }
        format.json { render :new, status: :created, location: @stock }
      else
        format.html { render :new, notice: 'Incomplete action, try again' }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
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
