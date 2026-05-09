/// INITIAL SOLUTION
// I can make 3 loops, first two loops go left to right,and right to left, keeping track of whats the tallest
// column to the left and right of the column
// next for loop goes through each column, storing max height including itself, looks at tallest left and right, and adds
class Solution {
    func trap(_ height: [Int]) -> Int {

        var leftHeight: [Int] = Array(repeating: 0, count: height.count)
        var rightHeight: [Int] = Array(repeating: 0, count: height.count)

        var leftMax = 0
        var rightMax = 0

        var sol = 0

        for i in 0 ..< height.count {
            leftMax = max(height[i], leftMax) 
            leftHeight[i] = leftMax
        }

        for i in stride(from: height.count - 1, through: 0, by: -1) {
            rightMax = max(height[i], rightMax)
            rightHeight[i] = rightMax
        }

        // for this last pass, we can look at the leftmax and right max at that index, find the min between 
        // the two, and subtract the hieght at that index to get the water at said index
        for i in 0 ..< height.count {
            sol = min(leftHeight[i], rightHeight[i]) + sol - height[i]
        }

        return sol
    }
}
// Review
// Time: we use 3 for loops not nested, o(n)
// Space: we did have to use extra arrays of n, so o(n)


/// REFACTORING
// Idea is to use two pointers, move them inwards keeping track of left and right max
class Solution {
    func trap(_ height: [Int]) -> Int {

        var leftMax = height[0]
        var rightMax = height[height.count - 1]

        var left = 0
        var right = height.count - 1

        var sol = 0

        // idea is that if left is smaller than right, or right smaller tahn left,
        // we can move the pointer of which ever is smaller, look at the value at the new location of pointer
        // and see if its the new left max/ right max, if it is, replace it, and solution
        // we just do the max - the height of that location, giving us the water
        // if that location happens to be the left or right max, it minuses itself
        while left < right {
            if leftMax < rightMax {
                left += 1
                leftMax = max(leftMax, height[left])
                sol += leftMax - height[left]

            } else {
                right -= 1
                rightMax = max(rightMax, height[right])
                sol += rightMax - height[right]

            }
        }
        return sol
    }
}
// Review
// Time: only one loop, o(n)
// Space: No additional data structs, o(1)