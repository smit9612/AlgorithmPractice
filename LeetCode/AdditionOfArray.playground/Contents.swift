import UIKit

extension BinaryInteger {
    
    var arrayOfDigit: [Int] {
        return String(self).compactMap { $0.wholeNumberValue ?? 0 }
    }
}

func add(_ arrayA: [Int], _ countA: Int, _ arrayB: [Int], _ countB: Int) -> [Int] {
    var resultArray : [Int] = []
    var i = countA, j = countB
    var carryOver = 0
    while j >= 0 {
        var sum = arrayA[i] + arrayB[j] + carryOver
        if sum > 9 {
            sum = sum % 10
            carryOver = 1
        } else {
            carryOver = 0
        }
        i -= 1
        j -= 1
        resultArray.insert(sum, at: 0)
    }
    
    if i >= 0 {
        while i >= 0 {
            
            resultArray.insert(arrayA[i]+carryOver, at: 0)
            carryOver = 0
            i -= 1
        }
    }
    return resultArray
}

//func subtract(_ arrayA: [Int], _ countA: Int, _ arrayB: [Int], _ countB: Int) -> [Int] {
//
//}
//
//func multiply(_ arrayA: [Int], _ countA: Int, _ arrayB: [Int], _ countB: Int) -> [Int] {
//
//}

let a = 1
let b = 9999

let arrayA = a.arrayOfDigit
let arrayB = b.arrayOfDigit
var sum: [Int] = []
// Check which has more number, it will go first
if arrayA.count >= arrayB.count {
    sum = add(arrayA, arrayA.count - 1, arrayB, arrayB.count - 1)
} else {
    sum = add(arrayB, arrayB.count - 1, arrayA, arrayA.count - 1)
}

print(sum)



