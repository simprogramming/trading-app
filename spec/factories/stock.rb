FactoryBot.define do
  factory :stock do
    symbol { 'AAPL' }
    name { 'Apple Inc' }
    category { 'Technology' }
    grade { 'A' }
  end
end