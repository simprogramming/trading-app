

const newPosition = () => {

  const symbol = document.querySelector("#select_stock_id")
  const jquery_symbol = $('#select_stock_id')
  // const quantity = document.querySelector("#position_quantity_1")
  const entry = document.querySelector("#position_current_price")
  if (symbol) {
    jquery_symbol.on('change', (event) => {
      fetch(`https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-quotes?region=US&lang=en&symbols=${symbol.options[symbol.selectedIndex].text}`,{
        "method": "GET",
        "headers": {
          "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com",
          "x-rapidapi-key": "df97fa1f5bmsh8076ba136b5de40p173515jsn39b34425b6d2"
        }
      })
      .then(response => response.json())
      .then((data) => {
        entry.value = (data['quoteResponse']['result'][0]['regularMarketPrice'])
      });
    });
  }
}

export {newPosition}
