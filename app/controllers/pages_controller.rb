class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dashboard]
  def home
  end

  def my_watchlist
    @hot_stock = HotStock.new
  end


  def scoreboard
    @user = current_user
    @users = User.all
    @positions = Position.where(user_id: current_user.id)
    @all_positions = Position.all
  end

  def dashboard
    @hot_stocks = HotStock.all
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

  def admin
    @users = User.all
    @positions = Position.all
    @hot_stocks = HotStock.all
  end
end
