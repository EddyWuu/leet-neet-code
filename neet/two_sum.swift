/// INITIAL SOLUTION
// Initial thought: create a dictionary, each entry of array is the key, and have the value to reach the target be the second value
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var dict: [Int: Int] = [:] // [value of target - num/complement: index]

        for i in 0 ..< nums.count {
            
            if dict[target - nums[i]] == nil {
                dict[nums[i]] = i
            } else { 
                if let value = dict[target - nums[i]] {
                    return [value, i]
                }
            }
        }
        return []
    }
}

// Review
// Time: o(n), for loop
// Space: o(n), dictionary


/// REFACTORING
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indices = [Int: Int]() // val -> index

        for (i, n) in nums.enumerated() { // enumerated gives index, and value (index, value)
            indices[n] = i
        }

        for (i, n) in nums.enumerated() { // .enumerated givees a bunch of value pairs, iterate through those pairs
            let diff = target - n
            if let j = indices[diff], j != i { // if the index with complement exists, and j != i, we can return those two indexes. we need a check in this one bc my previous sol handles it itself with a check
                return [i, j]
            }
        }

        return []
    }
}

/// TEST CASES
var tests = [([1,2,3,4,5,6,7,8], 10), ([1, 2], 3), ([1, 1], 2)]
print(Solution().twoSum(tests[0].0, tests[0].1)) // 3, 5
print(Solution().twoSum(tests[1].0, tests[1].1)) // 0, 1
print(Solution().twoSum(tests[2].0, tests[2].1)) // 0, 1
