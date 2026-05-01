/// INITIAL SOLUTION
// Initial thought: encode the number of characters that the string is at the start of the string.
// ex. hello, world, would be 5#hello5#world. wehre the hashtag notes the end of the number
class Solution {

    func encode(_ strs: [String]) -> String {
        var encoded: String = ""
        for string in strs {
            encoded += "\(string.count)#\(string)"
        }
        return encoded
    }

    func decode(_ str: String) -> [String] {
        // use a position pointer to keep track of where we are, and the sub_string var to keep track of chars up to pointer
        var decoded: [String] = []
        var position = 0
        var sub_string = ""

        // while position valid
        while position < str.count {
            // swift indexing is weird, cant do str[0], must use index
            // let the index be the position of where the position pointer is pointing
            let index = str.index(str.startIndex, offsetBy: position)
            // char be the character in which the position pointer is pointing
            let char = str[index]
            // add that char into the sub_string
            sub_string += "\(char)"

            // once we encounter #, we can extract the string, howeverr many number of chars in sub_string
            if char == "#" {
                // need to drop last because added #
                sub_string = String(sub_string.dropLast(1))
                // grab the sub_string as an int since its a string right now
                var sub_string_as_int = Int(sub_string) ?? 0
                // get the end index of where the string will end, off set has a + 1 to include last index. exmaple:
                // 5 # h e l l o
                // 0 1 2 3 4 5 6
                let end = str.index(index, offsetBy: sub_string_as_int + 1)
                // append the strring , from index to the end
                decoded.append(String(str[str.index(after: index) ..< end]))
                // update position to new string start, and reset sub_string
                position = position + sub_string_as_int + 1
                sub_string = ""
            } else {
                position += 1
            }
        }
        return decoded
    }
}
// Review
// Time: encode: o(mn), decode: o(mn), m is number of strings, n is number of chars, because both functions touch the amount of strings and characters in the string
// Space: encode: o(mn), decode: o(mn), same as time, where we store both char and amount of strings, which can be really big. it can be as large as all the characters combined or as large as many strings in array

/// REFACTORING
class Solution {
    func encode(_ strs: [String]) -> String {
        var res = ""
        for s in strs {
            res += "\(s.count)#\(s)"
        }
        return res
    }

    func decode(_ s: String) -> [String] {
        var res = [String]()
        let sArr = Array(s)
        var i = 0

        while i < sArr.count {
            var j = i
            while sArr[j] != "#" {
                j += 1
            }
            let lengthStr = String(sArr[i..<j])
            let length = Int(lengthStr)!

            i = j + 1
            let end = i + length
            let substring = String(sArr[i..<end])
            res.append(substring)
            i = end
        }

        return res
    }
}
// a cleaner approach, where we convert string to an array