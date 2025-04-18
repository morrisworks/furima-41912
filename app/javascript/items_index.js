const priceInput = document.getElementById("item-price");
const add_tax_price = document.getElementById("add-tax-price");
const profit = document.getElementById("profit");



// 入力が変わるたびに計算するイベントを追加
priceInput.addEventListener("input", () => {
  const price = parseFloat(priceInput.value);  // 数値に変換
  if (!isNaN(price)){
    const tax_price = price * 0.1;
    add_tax_price.textContent = Math.floor(tax_price);  // 小数点以下切り捨て
  }else{
    add_tax_price.textContent = "0";  
  }
});

priceInput.addEventListener("input", () => {
  const price = parseFloat(priceInput.value);  // 数値に変換
  if (!isNaN(price)){
    const tax_price = Math.floor(price* 0.1)// 小数点以下切り捨て
    profit.textContent = price - tax_price;  
  }else{
    profit.textContent ="0";  
  }
});