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

  hot_stock = HotStock.new(
    date: Date.today - rand(0..10),
    stock: new_stock,
    user: user
  )
  hot_stock.save


  2.times do
    positions = Position.new(
      entry_1: rand(1..15),
      quantity_1: rand(1..15),
      close_1: rand(1..15),
      c_quantity_1: rand(1..15),
      stock: new_stock
    )
    positions.save
  end
end










