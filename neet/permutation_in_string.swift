/// INITIAL SOLUTION
// initial thought: keep a dict of the values of s1, with sliding window move across s2 keeping a dict of s2
// of the sliding window stuff, which would be of the size of s1. moving the window size of s1 across s2,
// and comapre the two dicts
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        if s1.count > s2.count { return false }

        var s1dict: [Character: Int] = [:]
        var s2dict: [Character: Int] = [:]
        let charArray = Array(s2)
        for char in s1 {
            if s1dict[char] != nil {
                s1dict[char, default: 0] += 1
            } else {
                s1dict[char, default: 0] = 1
            }
        }

        var left = 0
        var right = s1.count - 1

        // fill up initially
        for i in 0 ..< s1.count {
            if s2dict[charArray[i]] != nil {
                s2dict[charArray[i], default: 0] += 1
            } else {
               s2dict[charArray[i], default: 0] = 1 
            }
        }

        // go up to one before the last index
        while right < s2.count - 1 {

            if s1dict == s2dict {
                return true
            } else {
                // we move left and right pointer, and delete the old char from s2dict, and add new char
                // delete old value
                if let value = s2dict[charArray[left]] {
                    // when we decrement to 0, we gotta remove the key, not just keep the key or else comparing
                    // dicts wont match
                    if value == 1 {
                        s2dict.removeValue(forKey: charArray[left])
                    } else {
                        s2dict[charArray[left]] = value - 1
                    }
                }

                left += 1
                right += 1
                // add new value
                if s2dict[charArray[right]] != nil {
                    s2dict[charArray[right], default: 0] += 1
                } else {
                    s2dict[charArray[right], default: 0] = 1 
                }
            }
        }
        // check the last window
        return s1dict == s2dict
    }
}
// Review
// Time: one for loop through s1, which ill call m for indices of s1, another through s1 again, 
// and another one through s2 of n. n is usually larger so o(n). but precise itll be: o(n + 2m) = o(n + m)
// Space: space i used a char array, and 2 dicts, but no nesting, so o(n). But chars are only 26 characters, 
// so really its o(1)

