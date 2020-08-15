import React from 'react'
import ReactDOM from 'react-dom'
// import PropTypes from 'prop-types'

import Day1 from './days/day1'
import Day2 from './days/day2'
import Day3 from './days/day3'
import Day4 from './days/day4'
import Day5 from './days/day5'

export default function DerivativesCalendar() {
  return (
    <div className="d-flex">
      <Day1 />
      <Day2 />
      <Day3 />
      <Day4 />
      <Day5 />
    </div>
  );
}


const derivatives = document.getElementById('derivatives');
  ReactDOM.render(<DerivativesCalendar />, derivatives);


