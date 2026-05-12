/// INITIAL SOLUTION
// Initial thought: we use a set to keep track of dups. move right pointer up until max string length
// if we dont find a dup, increase right, insert the char into the set, and sol is the max between itself and
// right - left. if we do find a dup, move left pointer up until it reaches the dup, all teh while removing 
// characters from the set
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        if s.isEmpty { return 0 }

        let charArray = Array(s)
        var dups: Set<Character> = []
        dups.insert(charArray[0])
        var left = 0
        var right = 1
        var sol = 1

        while right < s.count {
            if !dups.contains(charArray[right]) {
                dups.insert(charArray[right])
                right += 1
                sol = max(sol, right - left)
            } else {
                while charArray[left] != charArray[right] {
                    dups.remove(charArray[left])
                    left += 1
                }
                dups.remove(charArray[left])
                left += 1
            }
        }

        return sol
    }
}
// Review
// Time: o(n). Even though theres a nested while loop, all characters can only be removed once, so only 1 n
// Space: o(n) with the set

/// REFACTORING
// time and space will stay the same, but we can use a dictionary instead of a set to store the index of each character
// making us be able to jump left directly to the right position. o(m) m being unique chars. would be same as before
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        // character and its index
        var dict = [Character: Int]()
        let charArray = Array(s)
        if s.isEmpty { return 0 }
        var left = 0
        var sol = 1

        for i in 0 ..< charArray.count {
            // if the character is in the dictionary already, we move left up to that dictionary index point
            if let index = dict[charArray[i]] {
                // we move left until the repeated chars index, teh max iis there to ensure we dont move back
                left = max(index + 1, left)
            }
            // overwrite the old index of the dup with new one
            dict[charArray[i]] = i
            sol = max(sol, i - left + 1)
        }
        return sol
    }
}
