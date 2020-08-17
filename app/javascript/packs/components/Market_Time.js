import React from 'react'
import ReactDOM from 'react-dom'
// import PropTypes from 'prop-types'


export default function MarketTime() {
  const date = new Date()
  const hours = date.getHours()
  let timeOfDay

  if (hours > 9 && hours < 16) {
    timeOfDay = 'Market Open'
  } else {
    timeOfDay = 'Market Closed'
  }

  return (
    <h5>{timeOfDay}</h5>
  );
}



