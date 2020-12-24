class PagesController < ApplicationController
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
    @stock = Stock.new
    @tech_stocks = Stock.where(category: 'Technology')
    @financial_stocks = Stock.where(category: 'Financial')
    @real_estate_stocks = Stock.where(category: 'Real Estate')
    @telecom_stocks = Stock.where(category: 'Telecommunication')
    @health_care_stocks = Stock.where(category: 'Healthcare')
    @discretionary_stocks = Stock.where(category: 'Discretionary')
    @staple_stocks = Stock.where(category: 'Staple')
    @utilities_stocks = Stock.where(category: 'Utilities')
    @energy_stocks = Stock.where(category: 'Energy')
    @basic_material_stocks = Stock.where(category: 'Basic Material')
    @industrial_stocks = Stock.where(category: 'Industrial')
    @other_stocks = Stock.where(category: 'Others')
  end
end
