import Foundation

func numberOfCarryOperations(_ a: String, _ b: String) -> String {

    let num1Chars = Array(a.reversed())
    let num2Chars = Array(b.reversed())
    var i = 0, j = 0, sum = 0, carry = 0
    var res = ""
    var carryCount = 0
    while i < num1Chars.count || j < num2Chars.count || carry != 0 {
        sum = carry
        
        if i < num1Chars.count {
            sum += Int(String(num1Chars[i]))!
            i += 1
        }
        if j < num2Chars.count {
            sum += Int(String(num2Chars[j]))!
            j += 1
        }
        
        carry = sum / 10
        sum = sum % 10
        if carry > 0 {
            carryCount += 1
        }
        res.append(String(sum))
    }
    
    return String(res.reversed())
}



let a = 155, b = 55


let ab = numberOfCarryOperations(String(a), String(b))
print(Int(ab) ?? 0)
