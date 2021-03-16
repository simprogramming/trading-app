import React,  { useEffect, useState } from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'

// import PropTypes from 'prop-types'
const root = document.getElementById('root');

export default function DerivativesCalendar() {
    const [stocks, setStocks] = useState([]);
    const renderStock = (stocks) => {
        return stocks.map(ticker => {
            return (
                <div key={ticker.id} >
                    <p>{ticker.name}</p>
                </div>
                )
        })
    }

 useEffect(() => {
         axios.get('/stocks.json')
             .then(function (response) {
                 // handle success
                 const { data } = response;
                 setStocks(data);
             })
     },[]
 )
  return (
      <div>
          {renderStock(stocks)}
      </div>
  );
}
ReactDOM.render(<DerivativesCalendar />, root);


