
json.array!(@stocks) do |stock|
    json.extract! stock, :id, :name
    json.url stock_url(stock, format: :json)
end

# json.array!(@users) do |stock|
#   json.extract! stock, :id, :nickname
#   json.url stock_url(stock, format: :json)
# end