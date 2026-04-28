/// INITIAL SOLUTION
// Initial thought: dictionary with the key being the sorted letters of a grouped anagram, and the value being the anagrams
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {

        var dict = [String: [String]]()
        for string in strs {
            // if sorted string doesnt exist, add it as a key, and add that string
            if (dict[String(string.sorted())] == nil) {
                dict[String(string.sorted())] = [string]
            } else {
                // this means it does exist, we can add it to whatever key the value belongs in
                dict[String(string.sorted()), default: []].append(string)
            }
        }

        var result: [[String]] = []

        for values in dict.values {
            result.append(values)
        }

        return result
    }
}
// // Review
// Time: we have 2 for loops, and sorting in the first loop. sorting through m characters in a string, so mlogm.
// together its o(nmlogm), n is amount of strings, m is characters in strings
// Space: o(nm), because we are using dict and array, its stored stuff being another array.

// REFACTORING
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res = [Array<Int>: [String]]()

        for s in strs {
            var count = [Int](repeating: 0, count: 26)
            for c in s {
                count[Int(c.asciiValue!) - 97] += 1
            }
            res[count, default: []].append(s)
        }

        return Array(res.values)
    }
}
// Reivew
// Time: o(nm), no sorting, so no more sorting logm, but still need to go through every character, so still m in there.
// Space: same as previous solution, o(nm)

var tests = ["eat", "tea", "tan", "ate", "nat", "bat"]
print(Solution().groupAnagrams(tests)) // [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]