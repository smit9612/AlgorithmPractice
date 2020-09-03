// Longest substring without repeating chars
//Input: "abcadbcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.
// This is keep mapping
// [a: 1] startIdx = 0 maxLen = 0-0+1 = 1
// [a: 1, b: 2] startIdx = 0, maxLen = 1 - 0 + 1 = 2
// [a: 1, b: 2,c: 3] startidx = 0, maxLen = 2-0+1 = 3
// [b: 2, c: 3, a: 4] startidx = 1, maxLen = 3 - 1 + 1 = 3
// [b: 2, c: 3, a: 4, d: 5] staridx = 1, maxLen = 4-1+1 = 4
// [b: 6, c: 3, a: 4, d: 5] startidx = 2, maxLen = 5-2+1 = 4
// [b: 6, c: 7, a: 4, d: 5] startidx = 3, maxLen = 6-3+1 = 4
// [b: 6, c: 7, a: 4, d: 5] startidx = 3, maxLen = 6-3+1 = 4
// [b: 8, c: 7, a: 4, d: 5] startidx = 3, maxLen = max(4,7-6+1) = 4
func longestSubstring(_ s: String) -> Int {
    var maxLen = 0, startIdx = 0, charToPos = [Character: Int]()
    let sChar = Array(s)
    
    for (i, char) in sChar.enumerated() {
        if let pos = charToPos[char] {
            startIdx = max(startIdx, pos)
        }
        charToPos[char] = i + 1
        maxLen = max(maxLen, i - startIdx + 1)
    }
    return maxLen
}

let str = "abcadbcbb"
print(longestSubstring(str))



// Find the longest palindrom string from every index at the center. Very similar to merge sort/ quicksort
 // Time Complexity: O(n^2), Space Complexity: O(1)
// babab
// searchPalindrome([babab], 0, 0, 0, 0)

func longestPalindrome(_ s: String) -> String {
    // if string is only 1 lenght it is longest palindrome
    guard s.count > 1 else {
        return s
    }
    
    let sChars = Array(s)
    var maxLen = 0, start = 0
    for i in 0..<sChars.count {
        searchPalindrome(sChars, i, i, &start, &maxLen)
        searchPalindrome(sChars, i, i + 1, &start, &maxLen)
    }
    return String(sChars[start..<start + maxLen])
}

private func searchPalindrome(_ chars: [Character], _ left: Int, _ right: Int, _ start: inout Int, _ maxLen: inout Int) {
    
    var left = left, right = right
    while left >= 0 && right < chars.count && chars[left] == chars[right] {
        left -= 1
        right += 1
    }
    if maxLen < right - left - 1 {
        start = left + 1
        maxLen = right - left - 1
    }
    print("START:\(start) MAXLEN:\(maxLen)")
}

let palString = "cbbd"
print(longestPalindrome(palString))

/**
* Question Link: https://leetcode.com/problems/zigzag-conversion/
*
* Primary idea: The first and the last row, loop length is (2 * numRows - 2)
*               For each row between them, should insert another number, index = index + 2 * (numRows - i - 1)
*
* Time Complexity: O(log(n + m)), Space Complexity: O(1)
*
*/
func zigzagconvert(s: String, _ numRows: Int) -> String {

    if numRows == 1 {
        return s
    }
    
    var result = [Character]()
    var chars = [Character]()
}






