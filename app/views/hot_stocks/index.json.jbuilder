json.array!(@hot_stocks) do |stock|
  json.extract! stock, :id, :date, :direction
  json.url stock_url(stock, format: :json)
end