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
end
