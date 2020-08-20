import React,  { useEffect } from 'react'
import ReactDOM from 'react-dom'
// import PropTypes from 'prop-types'

import Day1 from './days/day1'
import Day2 from './days/day2'
import Day3 from './days/day3'
import Day4 from './days/day4'
import Day5 from './days/day5'
const root = document.getElementById('root');

const days = { derivatives: JSON.parse(root.dataset.derivatives)};
const Monday = days.derivatives[0].content;
const Tuesday = days.derivatives[1].content;
const Wesnesday = days.derivatives[2].content;
const Thursday = days.derivatives[3].content;
const Friday = days.derivatives[4].content

console.log(days)

export default function DerivativesCalendar() {



  return (
    <div className="d-flex">
      <Day1 day={Monday} days={days} />
      <Day2 day={Tuesday} days={days} />
      <Day3 day={Wesnesday} days={days} />
      <Day4 day={Thursday} days={days} />
      <Day5 day={Friday} days={days} />
    </div>
  );
}


  ReactDOM.render(<DerivativesCalendar />, root);


