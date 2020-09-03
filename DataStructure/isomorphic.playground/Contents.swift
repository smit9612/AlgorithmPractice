//Given two strings s and t, determine if they are isomorphic.
//
//Two strings are isomorphic if the characters in s can be replaced to get t.
//
//All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.

// Assuming string have same length

// Primary idea is to use dictionary
// * Time Complexity: O(n), Space Complexity: O(n)

class Solution {
    
    func isIsoMorphic(_ s: String, _ t: String) -> Bool {
        
        let sArray = Array(s), tArray = Array(t)
        var sDict = [Character: Character](), tDict = [Character: Character]()
        
        for (i, schar) in sArray.enumerated() {
          let tchar = tArray[i]
          
          if sDict[schar] == nil && tDict[tchar] == nil {
            sDict[schar] = tchar
            tDict[tchar] = schar
          } else if sDict[schar] != tchar && tDict[tchar] != schar {
            return false
          }
        }
        
        return true
    }
}


let s = "paper"
let t = "title"

Solution().isIsoMorphic(s, t) ? print("Strings are isomorphic") : print("String are different")

