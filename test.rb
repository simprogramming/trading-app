require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-quotes?region=US&lang=en&symbols=AAPL,AMZN")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'
request["x-rapidapi-key"] = 'df97fa1f5bmsh8076ba136b5de40p173515jsn39b34425b6d2'

response = http.request(request)
puts response.read_body


