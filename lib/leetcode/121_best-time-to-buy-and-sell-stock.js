/**
 * @param {number[]} prices
 * @return {number}
 */
const maxProfit = function(prices) {
  if (prices.length < 2) return 0;

  let minPrice = prices[0];
  let maxProfit = 0;

  for (let i = 1; i < prices.length; i++) {
    let currentProfit = prices[i] - minPrice;
    maxProfit = Math.max(currentProfit, maxProfit);
    minPrice = Math.min(minPrice, prices[i]);
  }

  return maxProfit;
};

let prices = [7, 1, 5, 3, 6, 4];
console.log(maxProfit(prices));
