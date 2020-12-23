# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "reset database"

HotStock.destroy_all
Position.destroy_all
Stock.destroy_all
User.destroy_all

# stocks = File.open("db/stocks.txt").readlines
# stocks_sorted = stocks.sort { |a, b| a <=> b }
# stocks_sorted.each do |stock|
#   new_stock = Stock.new(
#     symbol: stock.chomp
#   )
#   new_stock.save
# end

simon = User.create!(
  email: 'sim@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Simon',
  category: 'Technology',
  password: '123456'
  )

claude = User.create!(
  email: 'claude@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Claude',
  category: 'Consumer Staples',
  password: '123456'
  )

alain = User.create!(
  email: 'alain@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Alain',
  category: 'Technology',
  password: '123456'
  )

normand = User.create!(
  email: 'normand@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Normand',
  category: 'Technology',
  password: '123456'
  )

michel = User.create!(
  email: 'michel@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Michel',
  category: 'Basic Materials',
  password: '123456'
  )

lysane = User.create!(
  email: 'lysane@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Lysane',
  category: 'Healthcare',
  password: '123456'
  )

renee = User.create!(
  email: 'renee@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Renee',
  category: 'Communication',
  password: '123456'
  )

fernand = User.create!(
  email: 'fernand@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Fernand',
  category: 'Industrial Goods',
  password: '123456'
  )

denis = User.create!(
  email: 'denis@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Denis',
  category: 'Energy',
  password: '123456'
  )

adrien = User.create!(
  email: 'adrien@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Adrien',
  category: 'Technology',
  password: '123456'
  )
arthur = User.create!(
  email: 'arthur@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Arthur',
  category: 'Technology',
  password: '123456'
  )
yves = User.create!(
  email: 'yves@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Yves',
  category: 'Basic Materials',
  password: '123456'
  )
diane = User.create!(
  email: 'diane@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Dianes',
  category: 'Energy',
  password: '123456'
  )
serge = User.create!(
  email: 'serge@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Serge',
  category: 'Utilities',
  password: '123456'
  )
sylvie = User.create!(
  email: 'sylvie@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Sylvie',
  category: 'Healthcare',
  password: '123456'
  )
richard = User.create!(
  email: 'richard@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Richard',
  category: 'Healthcare',
  password: '123456'
  )




