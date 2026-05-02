/// INITIAL SOLUTION
// Initial thought: we can use sets to check if it has dups. we can check if [y][x] == ., skip if it it is
// get the value at that location, see if its in our sets, if it is, return false. otherwise insert into all the sets
// sets are in a dictionary with the index as key, so we dont need to reset
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {

        // where the key is the row/cols/box index
        var xCols = [Int: Set<Character>]()
        var yRows = [Int: Set<Character>]()
        var boxes = [Int: Set<Character>]()

        for y in 0 ..< board.count {
            for x in 0 ..< board[0].count {

                if board[y][x] != "." {
                    if xCols[x, default: Set<Character>()].contains(board[y][x]) {
                        return false
                    } else {
                        xCols[x, default: Set<Character>()].insert(board[y][x])
                    }

                    if yRows[y, default: Set<Character>()].contains(board[y][x]) {
                        return false
                    } else {
                        yRows[y, default: Set<Character>()].insert(board[y][x])
                    }

                    // boxes. box index formula from 2d to 1d is = row * MaxCols + cols
                    let boxIndex = (y / 3) * 3 + (x / 3)
                    if boxes[boxIndex, default: Set<Character>()].contains(board[y][x]) {
                        return false
                    } else {
                        boxes[boxIndex, default: Set<Character>()].insert(board[y][x])
                    }
                }
            }
        }
        return true
    }
}
// Review
// since everything is only 9 indexes, both time and space are o(1)