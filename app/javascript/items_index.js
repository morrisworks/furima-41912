const priceMethod = () => {

  const priceInput = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  // 入力が変わるたびに計算するイベントを追加
  priceInput.addEventListener("input", () => {
    const price = parseFloat(priceInput.value);  // 数値に変換
    if (!isNaN(price)){
      add_tax_price.textContent = Math.floor(price* 0.1)
      profit.textContent = price - Math.floor(price* 0.1);  
    }else{
      add_tax_price.textContent = "0";  
      profit.textContent ="0";  
    }
  });

}

// ページが完全に読み込まれたときにprice関数を実行
window.addEventListener("turbo:load", priceMethod);
// ページの中身が書き換えられたときにprice関数を実行
window.addEventListener("turbo:render", priceMethod);