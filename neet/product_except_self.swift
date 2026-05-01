/// INITIAL SOLUTION
// Initial thought: go through array, and multiply the left stuff by the right stuff. do a for loop first, to compute and indexes left and right values
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {

        var leftValues: [Int] = Array(repeating: 1, count: nums.count)
        var rightValues: [Int] = Array(repeating: 1, count: nums.count)
        var sol: [Int] = []

        for i in 0 ..< nums.count {
            if i != 0 {
                leftValues[i] = leftValues[i - 1] * nums[i - 1]
            }
        }

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if i != nums.count - 1 {
                rightValues[i] = rightValues[i + 1] * nums[i + 1]
            }
        }
        
        for i in 0 ..< nums.count {
            sol.append(leftValues[i] * rightValues[i])
        }
        return sol
    }
}
// Review
// Time: since we only got 3 for loops, o(n)
// Space: we use 3 arrays of size n, so o(n)

/// REFACTORING
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res = [Int](repeating: 1, count: nums.count)

        var prefix = 1
        for i in 0..<nums.count {
            res[i] = prefix
            prefix *= nums[i]
        }

        var postfix = 1
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            res[i] *= postfix
            postfix *= nums[i]
        }

        return res
    }
}
// Can cut down the space down to o(1), because we only use a res. output array dont count towards space