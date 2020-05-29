# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

HotStock.destroy_all
Position.destroy_all
Stock.destroy_all
User.destroy_all

user = User.create(
  email: Faker::Internet.email,
  password: "123456"
)
stocks = ['aapl', 'amzn', 'ge', 'acb', 'cgc']
stocks.each do |stock|
  new_stock = Stock.new(
    symbol: stock
  )
  new_stock.save

  2.times do
    hot_stock = HotStock.new(
      date: Date.today - rand(0..4),
      stock: new_stock,
      user: user
    )
    hot_stock.save
  end


  2.times do
    positions = Position.new(
      entry: rand(10..15),
      size: rand(100..200),
      stock: new_stock
    )
    positions.save
  end
end










