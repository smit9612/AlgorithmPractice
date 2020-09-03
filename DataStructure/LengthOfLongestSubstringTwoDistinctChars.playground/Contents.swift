
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

class Solution {
    
    
    // let
    // e c e b a
    
    // i = 0
    // longest = 0
    // charfreq e 1
    // counter
    
    //Time Complexity: O(n), Space Complexity: O(n)

    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int{
        // charFreq
        var subString = ""
        var start = 0, longest = 0, charFreq = [Character: Int]()
        let sArray = Array(s)
        for (i, char) in sArray.enumerated() {
            if let freq = charFreq[char] {
                charFreq[char] = freq + 1
            } else {
                if charFreq.count == 2 {
                    longest = max(longest, i - start)
                    if longest > subString.count {
                        let range = start..<longest
                        subString = s.substring(with: range)
                        print(subString)
                    }
                }
                
                while charFreq.count == 2 {
                    let charStart = sArray[start]
                    charFreq[charStart]! -= 1
                    
                    if charFreq[charStart] == 0 {
                        charFreq[charStart] = nil
                    }
                    start += 1
                }
            }
            charFreq[char] = 1
        }
        
        longest = max(longest, sArray.count - start)
        if longest > subString.count {
            let range = start..<longest
            subString = s.substring(with: range)
            print(subString)
        }
        return longest
        
    }
    
    
}


let str = "ababacccccc"
print(Solution().lengthOfLongestSubstringTwoDistinct(str))


