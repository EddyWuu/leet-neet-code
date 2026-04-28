/// INITIAL SOLUTION
// Initial thought: sort both the strings, and compare it
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var s_sorted = s.sorted()
        var t_sorted = t.sorted()

        if (s_sorted == t_sorted) {
            return true
        }
        return false
    }
}
// Review
// Time: o(slogs + tlogt). because sorting is o(nlogn)
// space: o(s + t), creating new sorted vars of arrays of the string, s and t



/// REFACTORING
// using dicts can cut down sorting time
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var s_dict = [Character: Int]()
        var t_dict = [Character: Int]()
        
        for char in s {
            if s_dict[char] == nil {
                s_dict[char] = 1
            } else {
                if let value = s_dict[char] {
                    s_dict[char] = value + 1
                }
            }
        } 

        for char in t {
            if t_dict[char] == nil {
                t_dict[char] = 1
            } else {
                if let value = t_dict[char] {
                    t_dict[char] = value + 1
                }
            }
            // this entire if block can be replaced with:
            // t_dict[char] = (t_dict[char] ?? 0) + 1
            // basically saying, if char in t_dict doesnt exist, make it 0, defaulted 0. if exist, just take the value. then add one
        }

        return s_dict == t_dict
    }
}
// Review
// Time: o(s + t), because has to go through both strings
// Space: o(s + t), needs two dictionaries

/// TEST CASES
var tests = [("racecar", "carrace"), ("thumb", "mubth"), ("", ""), ("race", "races")]
print(Solution().isAnagram(tests[0].0, tests[0].1)) // true
print(Solution().isAnagram(tests[1].0, tests[1].1)) // true
print(Solution().isAnagram(tests[2].0, tests[2].1)) // true
print(Solution().isAnagram(tests[3].0, tests[3].1)) // false