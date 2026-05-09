/// INITIAL SOLUTION
// Initial thought: idea is to have two pointers, one for sell, one for buy, so a left and a right
// we move left if the next left is smaller than current left, meaning better buy potentially
// otherwise we move the right forward looking for a better solution, finding MAX
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {

        var maxPrice = 0
        var left = 0
        var right = 1

        // make sure we include last index, which is prices.count - 1, so not up to there
        while right != prices.count {

            // if the right price is bigger than left, we can try and replace maxPrice with bigger one
            // then move right up
            if prices[right] > prices[left] {
                maxPrice = max(maxPrice, prices[right] - prices[left]) 
                right += 1

            } else {
                // if right price is equal or smaller, we should move left up to where right is, and right up 1
                left = right
                right += 1
            }
        }
        return maxPrice
    }
}
// Review
// Time: one simple while loop at worse case going through each index, o(n)
// Space: no additional data structure, o(1)