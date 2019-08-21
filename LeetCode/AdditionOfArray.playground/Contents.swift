import UIKit

extension BinaryInteger {
    
    var arrayOfDigit: [Int] {
        return String(self).compactMap { $0.wholeNumberValue ?? 0 }
    }
}

typealias ResultInfo = (result: Int, carryOver: Int)

enum OperationType {
    
    case add, substract, multiply
}

private func doSum(_ a: Int, _ b: Int, _ carryOver: Int) -> ResultInfo {
    
    var sum = a + b  + carryOver
    var c = 0
    if sum > 9 {
        sum = sum % 10
        c = 1
    }
    return ResultInfo(sum, c)
}

private func domultiply(_ a: Int, _ b: Int, _ carryOver: Int) -> ResultInfo {
    var multiply = a * b + carryOver
    var c = 0
    if multiply > 9 {
        multiply %= 10
        c /= 10
    }
    return ResultInfo(multiply, carryOver)
}

private func doSubtract(_ a: Int, _ b: Int, _ carryOver: Int) -> ResultInfo {
    var sub = a - b
    var c = 0
    if sub < 0 {
        sub = 10 - abs(sub)
        
    }
    return ResultInfo(sub, carryOver)
}

private func doOperation(_ type: OperationType, _ arrayA: [Int], _ countA: Int, _ arrayB: [Int], _ countB: Int) -> [Int] {
    var resultArray : [Int] = []
    var i = countA, j = countB
    var carryOver = 0
    while j >= 0 {
        var resultInfo: ResultInfo = ResultInfo(0, 0)
        switch type {
        case .add:
            resultInfo = doSum(arrayA[i], arrayB[j], carryOver)
        case .multiply:
            resultInfo = domultiply(arrayA[i], arrayB[j], carryOver)
        case .substract:
            resultInfo = ResultInfo(0, 0)
        }
        
        carryOver = resultInfo.carryOver
        i -= 1
        j -= 1
        resultArray.insert(resultInfo.result, at: 0)
    }
    
    if i >= 0 {
        while i >= 0 {
            let sumInfo: ResultInfo = doSum(arrayA[i], 0, carryOver)
            resultArray.insert(sumInfo.result, at: 0)
            carryOver = sumInfo.carryOver
            i -= 1
        }
    }
    
    if carryOver > 0 {
        resultArray.insert(carryOver, at: 0)
    }
    return resultArray
}

func doCalculate(_ type: OperationType, _ arrayA: [Int], _ arrayB: [Int]) -> [Int] {
    
    // Check which has more number, it will go first
    return arrayA.count >= arrayB.count ? doOperation(type, arrayA, arrayA.count - 1, arrayB, arrayB.count - 1)
        : doOperation(.add, arrayB, arrayB.count - 1, arrayA, arrayA.count - 1)
    
}


//func subtract(_ arrayA: [Int], _ countA: Int, _ arrayB: [Int], _ countB: Int) -> [Int] {
//
//}
//
//func multiply(_ arrayA: [Int], _ countA: Int, _ arrayB: [Int], _ countB: Int) -> [Int] {
//
//}

let a = 12
let b = 12

let arrayA = a.arrayOfDigit
let arrayB = b.arrayOfDigit
var sum: [Int] = doCalculate(.add, arrayA, arrayB)
print(sum)
var multiply = doCalculate(.multiply, arrayA, arrayB)
print(multiply)



