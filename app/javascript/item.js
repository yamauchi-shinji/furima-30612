function action (){
  const tax = 0.1
  const price = document.getElementById("item-price");
  price.addEventListener('input', (event) => {
    const fee = Math.floor(price.value * tax)
    document.getElementById("add-tax-price").textContent = fee
    const income = price.value - fee
    document.getElementById("profit").textContent = income.toLocaleString()
  });
}
setInterval(action, 1000);