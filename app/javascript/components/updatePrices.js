const updatePrices = () => {
  const btn = document.querySelector('#activate-btn')
  if (btn) {
    window.onload = function() {
      setInterval(function() {
        console.log("Price Updates for scoreboard")
        btn.click();
      }, 500000)
    }
  }
}


export { updatePrices };
