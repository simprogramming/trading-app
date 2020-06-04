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
Group.destroy_all

Group.create(objective: 100000)

3.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    nickname: Faker::Artist.name,
    description: Faker::GreekPhilosophers.quote,
    category:Faker::Commerce.department
  )
  user.save!
end

stocks = File.open("db/stocks.txt").readlines
stocks_sorted = stocks.sort { |a, b| a <=> b }
stocks_sorted.each do |stock|
  new_stock = Stock.new(
    symbol: stock
  )
  new_stock.save
end










