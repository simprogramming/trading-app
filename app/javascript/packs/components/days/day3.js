import React, { useState, useEffect } from 'react';

const LOCAL_STORAGE_KEY = "derivatives3.save"

function Day3(props) {
  // const days = { derivatives: JSON.parse(root.dataset.derivatives)};
  // const initialState = days.derivatives[2].content
  const initialState = props.day
  const days = props.days


  let [text, setText] = useState(initialState);

  function handleTextChange(e) {
    setText(e.target.value);
  }

  // useEffect(() => {
  //   const storedDerivatives = JSON.parse(localStorage.getItem(LOCAL_STORAGE_KEY))
  //   if (storedDerivatives) setDerivatives(storedDerivatives)
  // }, [])

  useEffect(() => {
    const newState = [...text].join('');
    days.derivatives[2].content = newState
  }, [text])

  return (
    <div className="derivatives-card">
      <div className="container p-3">
        <textarea value={text} onChange={handleTextChange} />
      </div>
    </div>
  );
}

export default Day3;
