/// INITIAL SOLUTION
// Initial thought: we can for loop through the numbers after its sorted, and do the same as two sum
// where we have a left and right pointer, compare to target, and - + the pointers accordingly
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorted = nums.sorted()
        var sol: [[Int]] = []
        
        for i in 0 ..< sorted.count - 1 {

            // skip if duplicate found for i
            if i > 0 && sorted[i] == sorted[i - 1] {
                continue
            }
            var left = i + 1
            var right = sorted.count - 1

            while left < right {
                if sorted[i] + sorted[left] + sorted[right] < 0 {
                    left += 1
                } else if sorted[i] + sorted[left] + sorted[right] > 0 {
                    right -= 1
                } else {
                    sol.append([sorted[i], sorted[left], sorted[right]])
                    left += 1
                    right -= 1

                    // next two while loops check for left and right dups, if exist, skip them after we've moved the pointer
                    while left < right && sorted[left] == sorted[left - 1] {
                        left += 1
                    }
                    // i dont need another while loop to go through the right side actually
                    // because the idea is once you find a match, you skip dips on at least one side to aviod adding the same triplet twice
                    // while left < right && sorted[right] == sorted[right + 1] {
                    //     right -= 1
                    // }
                    
                }
            }
        }
        return sol
    }
}
// Review
// Time: a sort function of nlogn, a for loop n, and a neted while loop going from left to right
// and another nested while loop checking dups. the new nested while loops cover each index once, no repeats.
// the sort is outside the while loop, so the nested loops dominiate the nlogn, so: o(n^2)
// Space: o(n) with the sorted array, cant sort in place. if we consider output, o(m) m being number of triplets. 
// output is usually required but we can acknowledge it