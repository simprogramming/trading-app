require 'json'



filepath = 'response.json'
symbols_bid = File.read(filepath)
bid = JSON.parse(symbols_bid)

p bid['quoteResponse']['result'][0]['bid']

