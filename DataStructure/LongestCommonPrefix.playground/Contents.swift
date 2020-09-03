import UIKit

//Time Complexity: O(nm), Space Complexity: O(m), m stands for the length of longest prefix
//Better solution may be binary search tree and trie prefix solution

func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""
    guard let firstStr = strs.first else {
        return ""
    }
    
    for (i, char) in firstStr.enumerated() {
        for str in strs.dropFirst() {
            if i == str.count {
                return result
            }
            
            let currentStrChar = str[str.index(str.startIndex, offsetBy: i)]
            if char != currentStrChar {
                return result
            }
        }
        result.append(char)
    }
    return result
}


let strArray = ["flower", "flow", "fl"]
print(longestCommonPrefix(strArray))
