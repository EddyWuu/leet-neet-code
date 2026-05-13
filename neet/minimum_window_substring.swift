/// INITIAL SOLUTION
// Initial thought: make both strings into char arrays.
// We have a have and need counter: have is the number of unique chars in the sliding window that satifies
// t. need is teh amount of unique chars needed to satisfy t. if have == need: we have satified the condition
// with our window, we can move left up until the condition isnt met anymore, becoming have < need.
// if have < need, we move right until it is satisfied again. all this time keeping track of the min window
// min window being the chars from left to right, the chars in that window. we can keep trakc of the indices 
// of min window. update if found better
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if t.isEmpty { return ""}

        let charArrays = Array(s)
        var dict: [Character: Int] = [:]
        var dictWindow: [Character: Int] = [:]

        for char in t {
            dict[char, default: 0] += 1
        }

        let need = dict.count
        var have = 0
        var left = 0
        var minLeft = 0
        var minRight = 0
        var minValue = Int.max

        for right in 0 ..< charArrays.count {
            let char = charArrays[right]
            dictWindow[char, default: 0] += 1
        
            if dictWindow[char] == dict[char] {
                have += 1
            } 
            
            // while valid, we can move left up, and also update min window
            while have == need {
                if right - left + 1 < minValue {
                    minValue = right - left + 1
                    minLeft = left
                    minRight = right
                }

                let leftChar = charArrays[left]
                dictWindow[leftChar, default: 0] -= 1
                // value in dict is the required count, value2 is the current count in dictWindow.
                // if the current count is smaller than the required count, so no longer satisfied, we decrement
                // we have moved teh left pointer to a poitn where this isnt satisfied naymore
                if let value = dict[leftChar], let value2 = dictWindow[leftChar], value > value2 {
                    have -= 1
                }
                left += 1
            }
        }
        return minValue == Int.max ? "" : String(charArrays[minLeft...minRight])
    }
}
// Review
// Time: we got one pass through s, one pass through t. the while loop doesnt add complexity since it only moves
// forward, so 2n, which is just n, so answer is o(n + m)
// Space: dict is 26 chars, dict array is n, o(n)