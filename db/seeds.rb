# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
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

caroline = User.create!(
  email: 'caroline@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Caroline',
  category: 'Technology',
  password: '123456'
  )
diane = User.create!(
  email: 'diane@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Diane',
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
francois = User.create!(
  email: 'francois@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Francois',
  category: 'Healthcare',
  password: '123456'
)
albert = User.create!(
  email: 'albert@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Albert',
  category: 'Healthcare',
  password: '123456'
)
eric = User.create!(
  email: 'eric@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Eric',
  category: 'Healthcare',
  password: '123456'
)
visitor = User.create!(
  email: 'visitor@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Visitor',
  category: 'Healthcare',
  password: '123456'
)
antonio = User.create!(
  email: 'antonio@email.com',
  description: Faker::GreekPhilosophers.quote,
  nickname: 'Antonio',
  category: 'Healthcare',
  password: '123456'
)

apple = Stock.create!(
  name: 'Apple Inc',
  symbol: 'AAPl',
  grade: 'A',
  category: 'Technology'
)

microsoft = Stock.create!(
  name: 'Microsoft Corp',
  symbol: 'MSFT',
  grade: 'A',
  category: 'Technology'
)

visa = Stock.create!(
  name: 'Visa Inc',
  symbol: 'V',
  grade: 'A',
  category: 'Technology'
)
mastercard = Stock.create!(
  name: 'Mastercard Inc',
  symbol: 'MA',
  grade: 'A',
  category: 'Technology'
)
nvda = Stock.create!(
  name: 'Nvidia Corp',
  symbol: 'NVDA',
  grade: 'A',
  category: 'Technology'
)
brk = Stock.create!(
  name: 'Berkshire Hathaway',
  symbol: 'BKR.B',
  grade: 'A',
  category: 'Financial'
)
jpm = Stock.create!(
  name: 'JP Morgan Chase & Company',
  symbol: 'JPM',
  grade: 'A',
  category: 'Financial'
)
bac = Stock.create!(
  name: 'Bank of Amarica Corp',
  symbol: 'BAC',
  grade: 'A',
  category: 'Financial'
)
c = Stock.create!(
  name: 'Citigroup Inc',
  symbol: 'C',
  grade: 'A',
  category: 'Financial'
)
wfc = Stock.create!(
  name: 'Wells Fargo & Company',
  symbol: 'WFC',
  grade: 'A',
  category: 'Financial'
)
amt = Stock.create!(
  name: 'American Tower Corp',
  symbol: 'AMT',
  grade: 'A',
  category: 'Real Estate'
)
pld = Stock.create!(
  name: 'Prologis Inc',
  symbol: 'PLD',
  grade: 'A',
  category: 'Real Estate'
)
cci = Stock.create!(
  name: 'Crown Castle International Corp',
  symbol: 'CCI',
  grade: 'A',
  category: 'Real Estate'
)
eqix = Stock.create!(
  name: 'Equinix Inc',
  symbol: 'EQIX',
  grade: 'A',
  category: 'Real Estate'
)
psa = Stock.create!(
  name: 'Public Storage',
  symbol: 'PSA',
  grade: 'A',
  category: 'Real Estate'
)
goog = Stock.create!(
  name: 'Alphabet',
  symbol: 'GOOGL',
  grade: 'A',
  category: 'Telecommunication'
)
fb = Stock.create!(
  name: 'Facebook',
  symbol: 'FB',
  grade: 'A',
  category: 'Telecommunication'
)
dis = Stock.create!(
  name: 'Walt Disney Company',
  symbol: 'DIS',
  grade: 'A',
  category: 'Telecommunication'
)
vz = Stock.create!(
  name: 'Verizon communications inc',
  symbol: 'VZ',
  grade: 'A',
  category: 'Telecommunication'
)
cmcsa = Stock.create!(
  name: 'Comcast Corp',
  symbol: 'CMCSA',
  grade: 'A',
  category: 'Telecommunication'
)
jnj = Stock.create!(
  name: 'Johnson & Johnson',
  symbol: 'JNJ',
  grade: 'A',
  category: 'Healthcare'
)
unh = Stock.create!(
  name: 'Unitedhealth Group Inc',
  symbol: 'UNH',
  grade: 'A',
  category: 'Healthcare'
)
mrk = Stock.create!(
  name: 'Merck & Company',
  symbol: 'MRK',
  grade: 'A',
  category: 'Healthcare'
)
pfe = Stock.create!(
  name: 'Pfizer',
  symbol: 'PFE',
  grade: 'A',
  category: 'Healthcare'
)
abt = Stock.create!(
  name: 'Abbott Laboratories',
  symbol: 'ABT',
  grade: 'A',
  category: 'Healthcare'
)
amzn = Stock.create!(
  name: 'Amazon.com Inc',
  symbol: 'AMZN',
  grade: 'A',
  category: 'Discretionary'
)
hd = Stock.create!(
  name: 'Home depot',
  symbol: 'HD',
  grade: 'A',
  category: 'Discretionary'
)
nke = Stock.create!(
  name: 'Nike Inc',
  symbol: 'NKE',
  grade: 'A',
  category: 'Discretionary'
)
mcd = Stock.create!(
  name: 'McDonalds Corp',
  symbol: 'MCD',
  grade: 'A',
  category: 'Discretionary'
)
sbux = Stock.create!(
  name: 'Starbucks Corp',
  symbol: 'SBUX',
  grade: 'A',
  category: 'Discretionary'
)
wmt = Stock.create!(
  name: 'Wal-Mart Stores',
  symbol: 'WMT',
  grade: 'A',
  category: 'Staple'
)
pg = Stock.create!(
  name: 'Procter & Gamble Company',
  symbol: 'PG',
  grade: 'A',
  category: 'Staple'
)
ko = Stock.create!(
  name: 'Coca-Cola Company',
  symbol: 'KO',
  grade: 'A',
  category: 'Staple'
)
pep = Stock.create!(
  name: 'Pepsico Inc',
  symbol: 'PEP',
  grade: 'A',
  category: 'Staple'
)
cost = Stock.create!(
  name: 'Costco Wholesale',
  symbol: 'COST',
  grade: 'A',
  category: 'Staple'
)
nee = Stock.create!(
  name: 'Nextera Energy',
  symbol: 'NEE',
  grade: 'A',
  category: 'Utilities'
)
duk = Stock.create!(
  name: 'Duke Energy Corp',
  symbol: 'DUK',
  grade: 'A',
  category: 'Utilities'
)
so = Stock.create!(
  name: 'Southern Company',
  symbol: 'SO',
  grade: 'A',
  category: 'Utilities'
)
d = Stock.create!(
  name: 'Dominion Resources',
  symbol: 'D',
  grade: 'A',
  category: 'Utilities'
)
exc = Stock.create!(
  name: 'Exelon Corp',
  symbol: 'EXC',
  grade: 'A',
  category: 'Utilities'
)
xom = Stock.create!(
  name: 'Exxon Mobil Corp',
  symbol: 'XOM',
  grade: 'A',
  category: 'Energy'
)
cvx = Stock.create!(
  name: 'Chevron Corp',
  symbol: 'CVX',
  grade: 'A',
  category: 'Energy'
)
cop = Stock.create!(
  name: 'Conophilips',
  symbol: 'COP',
  grade: 'A',
  category: 'Energy'
)
kmi = Stock.create!(
  name: 'Kinder Morgan',
  symbol: 'KMI',
  grade: 'A',
  category: 'Energy'
)
psx = Stock.create!(
  name: 'Philips 66',
  symbol: 'PSX',
  grade: 'A',
  category: 'Energy'
)
lin = Stock.create!(
  name: 'Linde Plc',
  symbol: 'LIN',
  grade: 'A',
  category: 'Basic Material'
)
shw = Stock.create!(
  name: 'Sherwin-Williams Company',
  symbol: 'SHW',
  grade: 'A',
  category: 'Basic Material'
)
ecl = Stock.create!(
  name: 'Ecolab Inc',
  symbol: 'ECl',
  grade: 'A',
  category: 'Basic Material'
)
apd = Stock.create!(
  name: 'Air Products and Chemicals',
  symbol: 'APD',
  grade: 'A',
  category: 'Basic Material'
)
dd = Stock.create!(
  name: 'Du Pont De Nemours Inc',
  symbol: 'DD',
  grade: 'A',
  category: 'Basic Material'
)
hon = Stock.create!(
  name: 'Honeywell International Inc',
  symbol: 'HON',
  grade: 'A',
  category: 'Industrial'
)
ups = Stock.create!(
  name: 'United Parcel Service',
  symbol: 'UPS',
  grade: 'A',
  category: 'Industrial'
)
unp = Stock.create!(
  name: 'Union Pacific Corp',
  symbol: 'UNP',
  grade: 'A',
  category: 'Industrial'
)
ba = Stock.create!(
  name: 'Boeing Company',
  symbol: 'BA',
  grade: 'A',
  category: 'Industrial'
)
rtx = Stock.create!(
  name: 'Raytheon Technologies Corp',
  symbol: 'RTX',
  grade: 'A',
  category: 'Industrial'
)




