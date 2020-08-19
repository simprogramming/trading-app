import React, { useState, useEffect } from 'react';

const LOCAL_STORAGE_KEY = "derivatives4.save"

function Day4() {
  const days = { derivatives: JSON.parse(root.dataset.derivatives)};
  const initialState = days.derivatives[3].content

  const [derivatives, setDerivatives] = useState(initialState);

  function handleDerivativesChange(e) {
    setDerivatives(e.target.value);
  }

  // useEffect(() => {
  //   const storedDerivatives = JSON.parse(localStorage.getItem(LOCAL_STORAGE_KEY))
  //   if (storedDerivatives) setDerivatives(storedDerivatives)
  // }, [])

  // useEffect(() => {
  //   localStorage.setItem(LOCAL_STORAGE_KEY, JSON.stringify(derivatives))
  // }, [derivatives])

  return (
    <div className="derivatives-card">
      <div className="container p-3">
        <textarea value={derivatives} onChange={handleDerivativesChange} />
      </div>
    </div>
  );
}

export default Day4;
