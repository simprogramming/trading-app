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
  description: 'I am looking to learn more about the Technology sector. I would like to have 5 active positions at all time',
  nickname: 'Sim',
  category: 'Technology',
  password: '123456'
  )

claude = User.create!(
  email: 'claude@email.com',
  description: 'I am looking to learn more about the Technology sector. I would like to have 5 active positions at all time',
  nickname: 'Sim',
  category: 'Technology',
  password: '123456'
  )

alain = User.create!(
  email: 'alain@email.com',
  description: 'I am looking to learn more about the Technology sector. I would like to have 5 active positions at all time',
  nickname: 'Sim',
  category: 'Technology',
  password: '123456'
  )

normand = User.create!(
  email: 'normand@email.com',
  description: 'I am looking to learn more about the Technology sector. I would like to have 5 active positions at all time',
  nickname: 'Sim',
  category: 'Technology',
  password: '123456'
  )

denis = User.create!(
  email: 'denis@email.com',
  description: 'I am looking to learn more about the Technology sector. I would like to have 5 active positions at all time',
  nickname: 'Sim',
  category: 'Technology',
  password: '123456'
  )

symbol = HotStock.create!(
  stock: Stock.find_by_symbol('AMZN'),
  date: Date.today - 2,
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
  user: simon,
  created_at: Date.today - 75.days + 15.5.hours
  )
prepare_position(position_3)

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



position_1.update(current_price: 351)







