import UIKit


struct Stack<T> {
    
    var elements = [T]()
    
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var top: T {
        return elements.last!
    }
    
    @discardableResult
    mutating func pop() -> T {
        return elements.removeLast()
    }
}


class Solution {
    
    func find132Pattern(_ nums: [Int]) -> Bool {
        var third = Int.min
        var s = Stack<Int>()
        // Stride through i
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if nums[i] < third {
                return true
            } else {
                
                while !s.isEmpty && nums[i] > s.top {
                    third = s.top
                    s.pop()
                }
                s.push(element: nums[i])
                print(s.elements)

            }
        }
        return false
    }
    
    func findNonDuplicate(_ nums: [Int]) -> Int {
        
        let dic = Dictionary(nums.map { ($0, 1)}, uniquingKeysWith: +)
        for (k,v) in dic {
            if v == 1 {
                return k
            }
        }
        return -1
    }
    
    func finDuplicate(_ nums: [Int]) -> Int {
        return nums.reduce(0){ $0 ^ $1 }
    }
    
    // bit manipulation
    func findDuplicated2(_ nums: [Int]) -> Int {
        var a = 0, b = 0
        for num in nums {
            let newA = (a & ~b & ~num) + (~a & b & num)
            let newB = (~a & b & ~num) + (~a & ~b & num)
            (a,b) = (newA, newB)
        }
        return a | b
    }
    
    func getSum(_ a: Int, _ b: Int) -> Int {
        let xor = a ^ b
        var and = a & b
        and = and << 1
        if xor & and != 0 {
            return getSum(xor, and)
        }
        return xor | and
    }
    
    func majorityElement(_ nums: [Int], target: Int?) -> Bool {
        let dic = Dictionary(nums.map { ($0, 1)}, uniquingKeysWith: +)
        var max = -1
        var maxKey = -1
        for (k,v) in dic {
            if v > max {
                max = v
                maxKey = k
            }
        }
        
        return maxKey == target
    }
}

//print(Solution().getSum(2, 3))
//print(Solution().finDuplicate([6, 1, 3, 3, 6]))
//Solution().find132Pattern([-1,3,2,0])
print(Solution().majorityElement([2,2,2,2,2,2,4,5,5,5,5,5,6], target: 2))
