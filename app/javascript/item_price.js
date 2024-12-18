const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTax = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = addTax;
    const profit = inputValue - addTax;
    const proFitDom = document.getElementById("profit");
    proFitDom.innerHTML = profit;
    
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);