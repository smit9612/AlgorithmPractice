import UIKit

func validPalindrome(_ array: [Character], _ start: Int, _ end: Int, _ isRemoved: Bool = false) -> Bool {
    var i = start, j = end
    while i < j {
        if array[i] != array[j] {
            // Check here if it alphanumeric etc
            return false
        } else {
            i += 1
            j -= 1
        }
    }
    return true
}
var str = "ab12ba"
let characters = Array(str)
validPalindrome(characters, 0, characters.count - 1) ? print("isValid") : print("isNotValid")







