import UIKit

// Time Complexity: O(n), Space Complexity: O(n)
func validPalindrome(_ s: String) -> Bool {
    
    let s = Array(s)
    return isValid(true, s) || isValid(false, s)
}

private func isValid(_ skipLeft: Bool, _ s: [Character]) -> Bool {
    
    var i = 0, j = s.count - 1, alreadySkipped = false
    
    while i < j {
        // valid palindrome
        if s[i] == s[j] {
            i += 1
            j -= 1
        } else {
            // check if passed already happens once or not
            if alreadySkipped {
                return false
            } else {
                alreadySkipped = true
                if skipLeft {
                    i += 1
                } else{
                    j -= 1
                }
            }
        }
    }
    return true
}


var s = "tebbem"
print(validPalindrome(s))


