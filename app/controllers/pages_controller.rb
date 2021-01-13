class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dashboard]
  def home
  end

  def my_watchlist
    @hot_stock = HotStock.new
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


  def scoreboard
    @user = current_user
    @users = User.all
    @positions = Position.where(user_id: current_user.id)
    @all_positions = Position.all
  end

  def dashboard
    @hot_stocks = HotStock.all
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

  def admin
    @users = User.all
    @positions = Position.all
    @hot_stocks = HotStock.all
  end
end
