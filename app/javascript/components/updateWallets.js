const updateWallets = () => {
  const btn = document.querySelector('#activate-wallet')
  if (btn) {
    window.onload = function() {
      setInterval(function() {
        console.log("Wallets Updated")
        btn.click();
      }, 500000)
    }
  }
}


export { updateWallets };
