/// INITIAL SOLUTION
// Initial thought: using two pointers, both start from start, and move 1 pointer up and compare its additive value until it equals target
// do it in place so its o(1) space
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        for i in 0 ..< numbers.count {
            for j in i ..< numbers.count {
                if numbers[i] + numbers[j] == target {
                    return [i + 1, j + 1]
                }
            }
        }

        return []
    }
}
// Review
// Time: two for loops, that go through the entirety of numbers, o(n^2)
// Space: I dont have any additional data structs, done in place, o(1)


/// REFACTORED
// we know that the array is sorted, and since its sorted, we can move the pointers accordingly if its bigger
// or smaller than the target.
// if left + right > target, we can move right pointer to be less, 
// if left + right < target, move left pointer up to be bigger
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        var left = 0
        var right = numbers.count - 1

        while numbers[left] + numbers[right] != target {
            if numbers[left] + numbers[right] < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return [left + 1, right + 1]
    }
}
// Review
// Time: at worse case, each entry is still only visited once, so o(n)
// Space: still o(1), same reason as previous solution