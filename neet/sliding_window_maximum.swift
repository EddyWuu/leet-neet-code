/// INITIAL SOLUTION
// Initial thought: starting off, i can keep an array or dict of size: nums.count - k + 1, as that is
// the amount of entries the sol will have. the sliding window always stays the same size. 
// the window i can keep a queue. the front is the max. when i append a value, before its appended, check 
// if the front is out of window first, if so remove it. if not keep it. and the value im about to append,
// remove items from the queue if its bigger than those items
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

        var deque = [Int]() // store indices
        var sol: [Int] = []
        var left = 0

        for right in 0 ..< nums.count {

            // while the deques first item is out of the sliding window, remove that item
            while let value = deque.first,  value < left {
                if !deque.isEmpty {
                    deque.removeFirst()
                }
            }
            // while loop to check if last index of queue is smaller than new entry, if so remove
            while let value = deque.last, nums[value] < nums[right] {
                if !deque.isEmpty {
                    deque.removeLast()
                }
            }

            deque.append(right)

            // If the sliding window is valid. we dont check deque size. we check if its past k size - 1
            if right >= k - 1 {
                if let value = deque.first {
                    sol.append(nums[value])
                }
                left += 1
            }
        }

        return sol
    }
}
// Review
// Time: o(n). for loop through nums. and two while loops in there, but each element is added to deque
// only once and removed at most once. not really looping through it. the while loop doesnt repeat
// work on the same elements hence not o(nk)
// Space: i use a deque size at most k, and a sol at most size n. but sol doesnt count. so o(k). but if
// we include it, o(n)
