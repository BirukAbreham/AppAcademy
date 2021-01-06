// Work through this problem on https://leetcode.com/problems/coin-change-2/ and use the specs given there.
// Feel free to use this file for scratch work.

// You are given coins of different denominations and a total amount
// of money. Write a function to compute the number of combinations
// that make up that amount. You may assume that you have infinite number
// of each kind of coin.
//
// Example:
// coinChange([1, 2, 5], 5)  // => 4
// explanation, there are four ways to make up the amount:
// 5=5
// 5=2+2+1
// 5=2+1+1+1
// 5=1+1+1+1+1
//
// Examples:
// coinChange([1, 2, 5], 5) // => 4
// coinChange([2], 3)       // => 0
// coinChange([10]), 10)    // => 1

function coinChange(coins, amount, memo = {}) {
  if (amount === 0) return 1;

  let key = `${amount}-${coins.join(",")}`;
  if (key in memo) return memo[key];

  let currentCoin = coins[coins.length - 1];
  let total = 0;

  for (let qty = 0; qty * currentCoin <= amount; qty++) {
    total += coinChange(coins.slice(0, -1), amount - qty * currentCoin, memo);
  }

  memo[key] = total;
  return memo[key];
}

module.exports = {
  coinChange,
};
