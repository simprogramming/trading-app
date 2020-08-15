// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { newPosition } from '../components/new_position.js'
import { initSelect2 } from '../plugins/select2.js'





// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  newPosition();
  initSelect2();
});


$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

 // def perform

// url = URI(`https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-quotes?region=US&lang=en&symbols=${symbols.uniq.join(',')}`)
// http = Net::HTTP.new(url.host, url.port)
// http.use_ssl = true
// http.verify_mode = OpenSSL::SSL::VERIFY_NONE

// request = Net::HTTP::Get.new(url)
// request["x-rapidapi-host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'
// request["x-rapidapi-key"] = 'df97fa1f5bmsh8076ba136b5de40p173515jsn39b34425b6d2'

// response = http.request(request)
 //    positions = Position.all

 //    symbols = []
 //    positions.each do |position|
 //      symbols << position.stock.symbol
 //    end

 //    url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-quotes?region=US&lang=en&symbols=#{symbols.uniq.join(',')}")

 //    http = Net::HTTP.new(url.host, url.port)
 //    http.use_ssl = true
 //    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

 //    request = Net::HTTP::Get.new(url)
 //    request["x-rapidapi-host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'
 //    request["x-rapidapi-key"] = 'df97fa1f5bmsh8076ba136b5de40p173515jsn39b34425b6d2'

 //    response = http.request(request)

 //    bid = JSON.parse(response.read_body)
 //    new_price = bid['quoteResponse']['result'].each do |result|
 //      Position.joins(:stock).where(stocks: {symbol: result['symbol']}).each do |position|
 //        position.update({current_price: result['bid']})
 //      end
 //    end

 //  end
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
