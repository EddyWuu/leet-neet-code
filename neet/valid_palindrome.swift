/// INITIAL SOLUTION
// Initial thought: a pointer from the back and the front, and converge them into the middle, comparing
// get rid of spaces first, and consider odd vs even numbers. also need to get rid of everything but letters
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let justLetters = s.filter {$0.isLetter || $0.isNumber}
        print(justLetters)
        let strings = Array(justLetters.lowercased())

        var left = 0
        var right = strings.count - 1
        
        while left < right {
            if strings[left] != strings[right] {
                print(strings[left])
                print(strings[right])
                return false
            }
            left += 1
            right -= 1
        }
        return true
        
    }
}
// Review
// Time: o(n). going through all of n
// Space: o(n). with the array. But you can technically make it o(1), doing it in place. But 
// that can be verbose and complicated as you need to use string.Index. but by neetcode logic, my thing is o(1)