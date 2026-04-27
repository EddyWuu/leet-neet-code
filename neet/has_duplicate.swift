/// INITIAL SOLUTION
// Initial thought: use a dictionary to count occurences of each number. If we see a number we've already seen, return true. If we finish the loop without finding duplicates, return false.
class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var dict = [Int:Int]() // [number:occurences]

        for num in nums {
            if dict[num] == nil {
                dict[num] = 1
            } else {
                return true
            }
        }
        return false
    }
}

// Review
// Time: O(n) — one pass through the array, and dictionary lookups are O(1)
// Space: O(n) — in the worst case the dictionary stores every element, same as the input array


/// REFACTORING
// Theres a better data struct for this problem: A set, which stores unique values.
class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = []

        for num in nums {
            if set.contains(num) {
                return true
            } else {
                set.insert(num)
            }
        }
        return false
    }
}

// Review
// Time: O(n) — one pass through the array, and set lookups are O(1)
// Space: O(n) — in the worst case the set stores every element, same as the input array
// cleaner solution than the dictionary approach, since we don't care about counting occurences, just whether we've seen the number before or not.