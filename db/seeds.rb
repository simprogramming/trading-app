# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def prepare_position(position)
  if position.buy_sell == "Buy"
      position.r1 = position.baseline + ((position.target - position.baseline) * 0.3) # creates theoretical sell price
      position.r2 = position.baseline + ((position.target - position.baseline) * 0.7)
      position.r3 = position.target
      # current_user.cash -= position.size * position.entry
    else
      position.r1 = position.baseline - ((position.baseline - position.target) * 0.3)
      position.r2 = position.baseline - ((position.baseline - position.target) * 0.7)
      position.r3 = position.target
      # current_user.cash += position.size * position.entry
    end

    position.remaining_size = position.size
    position.save
    if position.buy_sell == "Buy"
      position.user.cash -= position.size * position.entry
      position.user.equity += position.size * position.entry
      position.user.save
    else
      position.user.cash += position.size * position.entry
      position.user.equity -= position.size * position.entry
      position.user.save
    end
end

HotStock.destroy_all
Position.destroy_all
Stock.destroy_all
User.destroy_all
Group.destroy_all
Group.create(objective: 100000)

stocks = File.open("db/stocks.txt").readlines
stocks_sorted = stocks.sort { |a, b| a <=> b }
stocks_sorted.each do |stock|
  new_stock = Stock.new(
    symbol: stock.chomp
  )
  new_stock.save
end

sector = ['Technology', 'Communication', 'Industrial Goods', 'Utilities', 'Basic Materials', 'Energy', 'Healthcare', 'Consumer Discretionnary', 'Financial', 'Real Estate', 'Consumer Staples']
simon = User.create!(
  email: 'sim@email.com',

  description: Faker::GreekPhilosophers.quote,
  nickname: 'Simon',

  description: 'Trader with 2 years of experience, I am passionate about the Technology sector. Willing to learn and improve everyday.',
  nickname: 'Simer',

  category: 'Technology',
  password: '123456'
  )

claude = User.create!(
  email: 'claude@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Claudius',
  category: 'Communication',
  password: '123456'
  )

alain = User.create!(
  email: 'alain@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Le Sage',
  category: 'Financial',
  password: '123456'
  )

normand = User.create!(
  email: 'normand@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Norm',
  category: 'Technology',
  password: '123456'
  )

denis = User.create!(
  email: 'denis@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'The wise trader',
  category: 'Consumer Discretionnary',
  password: '123456'
  )

# --------------------------------------------------------------------


symbol = HotStock.create!(
  stock: Stock.find_by_symbol('NFLX'),
  date: Date.today - 4,
  user: simon,
  direction: 'Buy'
  )
symbol = HotStock.create!(
  stock: Stock.find_by_symbol('FB'),
  date: Date.today - 4,
  user: simon,
  direction: 'Buy'
  )

position_1 = Position.create!(
  stock: Stock.find_by_symbol('AAPL'),
  entry: 280,
  size: 100,
  stop_loss: 275,
  baseline: 265,
  target: 350,
  buy_sell: "Buy",
  user: simon,
  created_at: Date.today - 50.days + 15.5.hours
  )
prepare_position(position_1)

position_2 = Position.create!(
  stock: Stock.find_by_symbol('TSLA'),
  entry: 350,
  size: 100,
  stop_loss: 340,
  baseline: 345,
  target: 950,
  buy_sell: "Buy",
  user: simon,
  created_at: Date.today - 35.days + 15.5.hours
  )
prepare_position(position_2)

position_3 = Position.create!(
  stock: Stock.find_by_symbol('GOOGL'),
  entry: 1150,
  size: 20,
  stop_loss: 1100,
  baseline: 1125,
  target: 1500,
  buy_sell: "Buy",
  user: denis,
  created_at: Date.today - 75.days + 15.5.hours
  )
prepare_position(position_3)

position_4 = Position.create!(
  stock: Stock.find_by_symbol('BAC'),
  entry: 19.5,
  size: 100,
  stop_loss: 19.15,
  baseline: 19.30,
  target: 25,
  buy_sell: "Buy",
  user: alain,
  created_at: Date.today - 65.days + 14.5.hours
  )
prepare_position(position_4)

position_5 = Position.create!(
  stock: Stock.find_by_symbol('SNAP'),
  entry: 16,
  size: 750,
  stop_loss: 15.90,
  baseline: 15.95,
  target: 20,
  buy_sell: "Buy",
  user: claude,
  created_at: Date.today - 15.days + 13.5.hours
  )
prepare_position(position_5)

position_6 = Position.create!(
  stock: Stock.find_by_symbol('HD'),
  entry: 180,
  size: 40,
  stop_loss: 170.5,
  baseline: 178,
  target: 220,
  buy_sell: "Buy",
  user: denis,
  created_at: Date.today - 10.days + 13.5.hours
  )
prepare_position(position_6)

position_7 = Position.create!(
  stock: Stock.find_by_symbol('JPM'),
  entry: 100,
  size: 120,
  stop_loss: 105,
  baseline: 103,
  target: 70,
  buy_sell: "Sell",
  user: alain,
  created_at: Date.today - 3.days + 14.5.hours
  )
prepare_position(position_7)

position_8 = Position.create!(
  stock: Stock.find_by_symbol('VISA'),
  entry: 240,
  size: 300,
  stop_loss: 235,
  baseline: 238,
  target: 340,
  buy_sell: "Buy",
  user: alain,
  created_at: Date.today - 14.days + 14.5.hours
  )
prepare_position(position_8)

position_9 = Position.create!(
  stock: Stock.find_by_symbol('KO'),
  entry: 60,
  size: 400,
  stop_loss: 62,
  baseline: 61,
  target: 40,
  buy_sell: "Sell",
  user: denis,
  created_at: Date.today - 80.days + 14.5.hours
  )
prepare_position(position_9)

position_10 = Position.create!(
  stock: Stock.find_by_symbol('MCD'),
  entry: 210,
  size: 120,
  stop_loss: 215,
  baseline: 212,
  target: 140,
  buy_sell: "Sell",
  user: normand,
  created_at: Date.today - 85.days + 14.5.hours
  )
prepare_position(position_10)

position_11 = Position.create!(
  stock: Stock.find_by_symbol('BA'),
  entry: 120,
  size: 110,
  stop_loss: 115,
  baseline: 119,
  target: 400,
  buy_sell: "Buy",
  user: normand,
  created_at: Date.today - 15.days + 14.5.hours
  )
prepare_position(position_11)

position_12 = Position.create!(
  stock: Stock.find_by_symbol('EA'),
  entry: 115,
  size: 100,
  stop_loss: 113,
  baseline: 114.50,
  target: 150,
  buy_sell: "Buy",
  user: denis,
  created_at: Date.today - 5.days + 14.5.hours
  )
prepare_position(position_12)

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    nickname: Faker::Artist.name,
    description: Faker::GreekPhilosophers.quote,
    category: sector.sample
  )
  user.save!
  buy_sell = ['Buy', 'Sell']
  stocks = File.open("db/stocks.txt").readlines
  hot_stock = HotStock.create!(
    stock: Stock.all.sample,
    date: (Date.today - rand(4..8)),
    user: user,
    direction: buy_sell.sample
  )
end

PriceUpdateJob.perform_now

position_1.update(current_price: 322.32)

position_2.update(current_price: 864.38)

position_3.update(current_price: 1414.30)

position_4.update(current_price: 26.78)

position_5.update(current_price: 19.26)

position_6.update(current_price: 248.95)

position_7.update(current_price: 106.2)

position_8.update(current_price: 310.52)

position_9.update(current_price: 49.31)

position_10.update(current_price: 180.4)

position_11.update(current_price: 213.94)

position_12.update(current_price: 117)
