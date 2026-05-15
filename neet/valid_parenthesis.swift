/// INITIAL SOLUTION
// Initial thought: keep a dictionary of parenthesis pairs, and keep a stack to keep track of whats been popped\
// if open brackets, put into stack, if closed bracket, pop the top and the stack and compare to closed
class Solution {
    func isValid(_ s: String) -> Bool {

        var dict: [Character: Character] = ["}": "{", "]": "[", ")": "("]
        var stack: [Character] = []
        var charArray = Array(s)

        if s.isEmpty {
            return false
        }

        for char in s {

            if char == dict["}"]! || char == dict["]"]! || char == dict[")"]! {
                stack.append(char)
            } else {
                if dict.keys.contains(char) {s
                    if stack.last == dict[char] {
                        stack.removeLast()
                    } else {
                        return false
                    }
                }
            }

        }
        return stack.isEmpty
    }
}
// Review
// Time: o(n) to go through all chars
// Space: o(n) for data structs

/// REFACTORING
// just clean up code a bit:
class Solution {
    func isValid(_ s: String) -> Bool {

        var dict: [Character: Character] = ["}": "{", "]": "[", ")": "("]
        var stack: [Character] = []

        if s.isEmpty {
            return false
        }

        for char in s {
            // if the char is a closed bracket, grab it and make it value
            if let value = dict[char] {
                // if stack isnt empty, and the last stack item is the open bracket pair to value which is a closed bracket
                // we can pop
                if !stack.isEmpty && stack.last! == value {
                    stack.popLast()
                } else {
                    // if its not, then its wrong
                    return false
                }
            } else {
                // else if the value isnt one in the dictionary, dict[char] doesnt exist hence its not a closed bracket
                // we can append
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}