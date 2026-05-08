/// INITIAL SOLUTION
// Initial thought: for loop through height, and have a second pointer on next one, and just move 
// it up and compare to max water i have so far
class Solution {
    func maxArea(_ heights: [Int]) -> Int {

        var maxWater = 0

        // goes up to heights.count - 2 because it needs at least one element to the right, occupying heights.count - 1
        for i in 0 ..< heights.count - 1 {
            // inner loop goes to heights.count because it needs to be included
            for k in i + 1 ..< heights.count {
                
                var limiter = min(heights[i], heights[k])
                maxWater = max(maxWater, (limiter * (k - i)))
            }
        }
        return maxWater
    }
}
// Review:
// Time: two for loops, going through all the indexes, o(n^2)
// Space: o(1), not using anything

/// REFACTORING
// idea is to start one pointer on left and another on right, after calculating area, we move a pointer
// determined by the limiter, which ever one is the shortest, because that gives us bigger chances of
// finding a bigger value
class Solution {
    func maxArea(_ heights: [Int]) -> Int {

        var maxWater = 0
        var left = 0
        var right = heights.count - 1

        while left < right {
            var limiter = min(heights[left], heights[right])
            maxWater = max(maxWater, limiter * (right - left))

            if heights[left] > heights[right] {
                right -= 1
            } else {
                left += 1
            }
        }
        return maxWater
    }
}
// Review
// Time: shorten down to o(n)
// Space: still o(1)