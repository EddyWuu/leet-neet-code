/// INITIAL SOLUTION
// Initial thought: put the array into a set. seraching in set is o(1), so loop through the set, and count by ones, keeping a counter to keep trakc and reset if the 
// consecutive sequence breaks. sotre the longest in a var, and replace if found longer
// the start of a sequence is the number where the number - 1 doesn't exist

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set: Set<Int> = Set(nums)
        var count = 0

        for num in set {
            if !set.contains(num - 1) {
                var temp = num
                var tempCounter = 0
                while set.contains(temp) {
                    temp += 1
                    tempCounter += 1
                } 
                count = max(tempCounter, count)
            }
        }

        return count
    }
}
// Review
// Time: we only loop through the set, so o(n). each number is visited only once thrugh all iterations even with nested while loop
// space: we create a set, max size n, so o(n)
