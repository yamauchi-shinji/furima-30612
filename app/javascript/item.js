function action (){
  const tax = 0.1
  const price = document.getElementById("item-price");
  price.addEventListener('input', (event) => {
    const fee = Math.floor(price.value * tax)
    document.getElementById("add-tax-price").textContent = fee.toLocaleString()
    const income = price.value - fee
    document.getElementById("profit").textContent = income.toLocaleString()
  });
}
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) { 
  setInterval(action, 1000);
}