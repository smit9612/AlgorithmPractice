import UIKit

import Foundation

// This solution runs 0(n) for each loop then run
class Solution {
  
    func singleNumber(_ nums: [Int]) -> Int {
        var uniqueNumber = [Int]()
        // 0(n)
        for i in 0...nums.count - 1 {
          
            // 0(n)
            if !uniqueNumber.contains(nums[i]) {
                uniqueNumber.append(nums[i])
            } else {
                let index = uniqueNumber.firstIndex(of: nums[i]) ?? 0
                uniqueNumber.remove(at: index)
            }
            print(uniqueNumber)
        }
        return uniqueNumber.first ?? 0
    }
    
    func singleNumber2(_ nums: [Int]) -> Int {
        var uniqueHashMap = [Int: Int]()
        // 0(n)
        for i in 0...nums.count - 1 {
            let number = nums[i]
            // 0(n)
            // put it in dictionary with index
            uniqueHashMap[number] = (uniqueHashMap[number] ?? 0 ) + 1
        }
        
        for (num, quantity) in uniqueHashMap {
            if quantity == 1 {
                return num
            }
        }
        return 0
    }
    
    // Bit Manipulatiorn
    func singleNumber3(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            res ^= num
        }
        return res
    }
    
    func singleNumberK(_ nums: [Int]) -> Int {
        var ans = 0
        var sum = 0
        for i in 0..<64 {
            sum = 0
            let tmp = (1<<i)
            
            for num in nums {
                print("Temp: \(tmp) Num: \(num), AND = \(tmp & num)")
                if tmp & num != 0 {
                    sum = sum + 1
                }
                print("Sum: \(sum)")
            }
            if sum % 3 == 1 {
                ans = ans ^ tmp
                
            }
            print("Ans: \(ans)")
            
        }
        
        return ans
    }
    
    func singleNumberZ(_ nums: [Int]) -> Int {
        
        var a = 0, b = 0
        for num in nums {
            // a & inverse b & inverse num +
            
            let a1 = a & ~b & ~num
            print("A1:\(a1)")
            let a2 = ~a & b & num
            print("A2:\(a2)")
            let newA = a1 + a2
            let b1 = ~a & b & ~num
            print("B1:\(b1)")
            let b2 =  ~a & ~b & num
            print("B2:\(b2)")
            
            let newB = b1 + b2
            (a, b) = (newA, newB)
        }
        return a | b
    }
    
    func repeatingNumber(_ nums: [Int]) -> [Int] {
        var uniqueHashMap = [Int: Int]()
        // 0(n)
        for num in nums {
            // 0(n)
            // put it in dictionary with index
            uniqueHashMap[num] = (uniqueHashMap[num] ?? 0 ) + 1
        }
        
        var result = [Int]()
        for (num, repeatedTimes) in uniqueHashMap {
            if repeatedTimes > 1 {
                result.append(num)
            }
        }
        return result
    }
    
    func repeatingNumber3(_ nums: [Int]) -> [Int] {
        
        var result = [Int]()
        var numArray = nums
        for (_, num) in numArray.enumerated() {
            let hashIndex = num - 1
            print(hashIndex)
            if numArray[hashIndex] > 0 {
                numArray[hashIndex] *= -1
            } else {
                result.append(num)
            }
            print(numArray)
        }
        return result
        
    }
    
//    func repeatingNumber2(_ nums: [Int]) -> [Int] {
//        var uniqueHashMap = [Int: Int]()
//        var result = [Int]()
//        // 0(n)
//        for index in 0..<nums.count {
//            var curNum = nums[index]
//            var newIndex = curNum - 1
//            while curNum != index + 1 && curNum != nums[newIndex] {
//                nums.swapAt(index, newIndex)
//                curNum = nums[index]
//                newIndex = curNum - 1
//            }
//        }
//
//
//        for (index, num) in numArr.enumerated() {
//            if num != index + 1 { result.append(num) }
//        }
//        return result
//    }
}

let array  = [5,6,5,1,2,6]
let number = Solution().repeatingNumber3(array)
print(number)
  
  

