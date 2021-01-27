FactoryBot.define do
  factory :hot_stock do
    symbol { 'AAPL' }
    name { 'Apple Inc' }
    category { 'Technology' }
    grade { 'A' }
  end
end