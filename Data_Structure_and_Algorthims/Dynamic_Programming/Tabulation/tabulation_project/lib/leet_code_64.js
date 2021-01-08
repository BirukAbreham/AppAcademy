// Work through this problem on https://leetcode.com/problems/minimum-path-sum/ and use the specs given there.
// Feel free to use this file for scratch work.

// Given a m x n grid filled with non-negative numbers, find a path from top left
// to bottom right, which minimizes the sum of all numbers along its path.
//
// Note: You can only move either down or right at any point in time.
//
//  ___ ___ ___
// | 1 | 3 | 1 |
// | 1 | 5 | 1 |
// | 4 | 2 | 1 |
//  --- --- ---
// Input: grid = [[1, 3, 1],[1, 5, 1],[4, 2, 1]]
// Output: 7
// Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
//
// Input: grid = [[1, 2, 3],[4, 5, 6]]
// Output: 12
//
function minPathSum(grid) {
  let table = [];
  for (let idx = 0; idx < grid.length; idx++) {
    table.push(new Array(grid[0].length).fill(0));
  }

  for (let i = grid.length - 1; i >= 0; i--) {
    for (let j = grid[0].length - 1; j >= 0; j--) {
      if (grid.length - 1 === i && grid[0].length - 1 === j) {
        table[i][j] = grid[i][j];
      } else {
        let toRight = j + 1 < grid[0].length ? j + 1 : undefined;
        let toDown = i + 1 < grid.length ? i + 1 : undefined;

        if (toRight && toDown) {
          let min = Math.min(table[i][toRight], table[toDown][j]);
          table[i][j] = grid[i][j] + min;
        } else if (toRight) {
          table[i][j] = grid[i][j] + table[i][toRight];
        } else if (toDown) {
          table[i][j] = grid[i][j] + table[toDown][j];
        }
      }
    }
  }

  return table[0][0];
}

// console.log(
//   minPathSum([
//     [1, 3, 1],
//     [1, 5, 1],
//     [4, 2, 1],
//   ])
// ); // => 7

// console.log(
//   minPathSum([
//     [1, 2, 3],
//     [4, 5, 6],
//   ])
// ); // => 12

module.exports = {
  minPathSum,
};
