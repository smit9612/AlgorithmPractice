import Foundation

class Solution {
  
  // Using two pointer method.
  func reverseVowels(_ s: String) -> String {
    
    var left = 0, right = s.count - 1
    var chars = Array(s)
    while left < right {
      let isVowelLeft = isVowel(chars[left]), isVowelRight = isVowel(chars[right])
      
      if isVowelLeft && isVowelRight {
        chars.swapAt(left, right)
        left += 1
        right -= 1
      } else {
        if !isVowelLeft {
          left += 1
        } else {
          right -= 1
        }
      }
    }
    return String(chars)
    
  }
  
  func isVowel(_ char: Character) -> Bool {
    return Set("aeiouAEIOU").contains(char)
  }
}


let solution = Solution()
var vowelString = "abcde"
print(solution.reverseVowels(vowelString))

vowelString = "ea ea"
print(solution.reverseVowels(vowelString))
