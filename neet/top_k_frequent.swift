/// INITIAL SOLUTION
// Initial thought: store the nums with the count of that num in a dict, and return that number
// class Solution {
//     func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//         var dict = [Int: Int]()

//         for num in nums {
//             if dict[num] == nil {
//                 dict[num] = 1
//             } else {
//                 if let value = dict[num] {
//                     dict[num] = value + 1
//                 }
//             }
//         }

//         let sortedByValue = dict.sorted { $0.value > $1.value }
//         var sol: [Int] = []
//         // i should loop through the dict, comparing counts and returning top k
//         for i in 0 ..< k {
//             sol.append(sortedByValue[i].key)
//         }
//         return sol
//     }
// }
// Review
// Time: one loop through nums, and one loop through k, but also a sort. o(nlogn). sequential loops dont count towards each other, only nested
// Space: 2 dicts of n, 1 array of k, so just o(n)

/// REFACTORING 
// idea of this is that in an array of numbers, the max frequency can only be the max entries in that array
// we can make an array of that size, and each index stores the number with that frequency
// but since numbers can have same frequency, it stores array of numbers
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var count = [Int: Int]()
        var freq = [[Int]](repeating: [], count: nums.count + 1)

        for num in nums {
            count[num, default: 0] += 1
        }
        // fill the index/frequency with that number, or append it if another number has that frequnecy too
        for (num, cnt) in count {
            freq[cnt].append(num)
        }

        var res = [Int]()
        // go backwards, because the highest number at end of array
        for i in stride(from: freq.count - 1, through: 1, by: -1) {
            // for each number in the the freq[i] entry (because there may be multiple numbers for one freq)
            // append that number to solution, until we reach k
            for num in freq[i] {
                res.append(num)
                if res.count == k {
                    return res
                }
            }
        }

        return res
    }
}
// Review
// Time: for loop through nums, for loop through nums again,and another for loop through nums again
// inside the last for loop theres another. BUT, we dont repeat coverage, if not covered by outer for loop,
// inside forloop covers it, but even so, it does not repeat coverage. It will never go above n, so o(n)
// Space: one dict, one array for sol, one array of arrays, but coverage is still only n, so also o(n)

// TEST CASES
var tests = [([1,2,3,4,5,6,1,2,3,4], 3), ([1,1,1,1,1,1], 0)]
print(Solution().topKFrequent(tests[0].0, tests[0].1))
print(Solution().topKFrequent(tests[1].0, tests[1].1))