require 'json'
require 'uri'
require 'net/http'
require 'openssl'
class MyPriceUpdateJob < ApplicationJob
  queue_as :default

  def perform

    positions = MyPosition.all

    symbols = []
    positions.each do |position|
      symbols << position.stock.symbol
    end

    url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-quotes?region=US&lang=en&symbols=#{symbols.uniq.join(',')}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'df97fa1f5bmsh8076ba136b5de40p173515jsn39b34425b6d2'

    response = http.request(request)

    bid = JSON.parse(response.read_body)
    new_price = bid['quoteResponse']['result'].each do |result|
      MyPosition.joins(:stock).where(stocks: {symbol: result['symbol']}).each do |position|
        close_price = result['regularMarketPrice']
        position.update({current_price: close_price})
        # call other method in there
        position.gain_loss_closed
      end
    end
  end
end
