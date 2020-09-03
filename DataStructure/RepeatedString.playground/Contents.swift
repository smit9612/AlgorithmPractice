import UIKit
// Find total number of a + number of a in last item
func repeatedString(s: String, n: Int) -> Int {
    
    let sChars = Array(s)
    let remainder = n%sChars.count
    
    var numLen = [Character: Int]()
    var lastitem = 0
    
    
    for (i, char) in sChars.enumerated() {
        if let repeatedValue = numLen[char] {
            numLen[char] = repeatedValue + 1
        } else {
             numLen[char] = 1
        }
        if i < remainder, char == "a" {
            lastitem += 1
        }
    
    }
    guard let noofA = numLen["a"] else { return 0 }
    
    
    if remainder == 0 {
        return noofA*(n/sChars.count)
    } else {
        return noofA*(n/sChars.count) + lastitem
    }
    
}

// output 2
let str = "aba"
let n = 10
let x = repeatedString(s: str, n: n)
print(x)
