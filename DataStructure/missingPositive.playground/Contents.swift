
class FirstMissingPositive {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        
        for i in 0..<nums.count {
            if !set.contains(i + 1) {
                return i + 1
            }
        }
        
        return nums.count + 1
    }
}

let array = [7,8,9,11,12,13]
let output = FirstMissingPositive().firstMissingPositive(array)
