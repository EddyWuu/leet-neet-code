/// INITIAL SOLUTION
// given a sliding window, the longest substring of that window can be the length of window - max freq
// if that value is smaller or equal to k, we can replace it to make it longer. otherwise we gotta move
// the pointers. i can expand the window as long as its equal or smaller, contract the window if k is bigger
// we can use a frequency dict
class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        
        var left = 0
        var sol = 0

        let charArray = Array(s)
        var dict: [Character: Int] = [:]

        // moving right pointer up
        for right in 0 ..< charArray.count {
            // add value into the dict of right, updating first since we start at nothing at dict
            if dict[charArray[right]] == nil {
                dict[charArray[right]] = 1
            } else {
                if let value = dict[charArray[right]] {
                    dict[charArray[right]] = value + 1
                }
            }
            // check our condition, if k is smaller than our window size minus largest freq of window, move
            // left up, decrement the removed left value by one
            if k < (right - left + 1) - (dict.values.max() ?? 0) {
                if let value = dict[charArray[left]] {
                    if value != 0 {
                        dict[charArray[left]] = value - 1
                    }
                }
                left += 1
            }
            // Always updating every iteration
            sol = max(sol, right - left + 1)
        }
        return sol
    }
}
// Review
// Time: o(n), each pointer touches each value at most once
// Space: I use a char array and a dict, so o(n). the dict technically can only have up to 26 chars, so o(1)
// if i indexed directly from the string i dont need the char array. so the whole thing cna be o(1)
