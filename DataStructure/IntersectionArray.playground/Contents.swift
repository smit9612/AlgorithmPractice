import Foundation


func intersection<T: Hashable>(_ nums1: [T], _ nums2: [T]) -> [T] {
    var set = Set(nums1), res = [T]()
    for num in nums2 where set.contains(num) {
        res.append(num)
        set.remove(num)
    }
    return res
}

func intersection2<T: Hashable>(_ nums1: [T], _ nums2: [T]) -> [T] {
    var result: [T] = []
    var nums = nums2
    for num in nums1 {
        if nums.contains(num) {
            result.append(num)
            nums.remove(at: nums.firstIndex(of: num)!)
        }
    }
    return result
}

func intersection3<T: Hashable>(_ nums1: [T], _ nums2: [T]) -> [T] {
    var result: [T] = []
    var freqMap = Dictionary(nums1.map { ($0, 1)}, uniquingKeysWith: +)
    for num in nums2 {
        if let freq = freqMap[num], freq > 0 {
            result.append(num)
            freqMap[num] = freq - 1
        }
    }
    return result
}

func commonChars(_ nums1: [String]) -> [String] {
    var result: [String] = []
    var freqMap = Dictionary(nums1[0].map { ($0, 1)}, uniquingKeysWith: +)
    for word in nums1[1...] {
        for key in freqMap.keys {
            let count = word.filter { $0 == key }.count
            freqMap[key] = min(freqMap[key]!, count)
        }
    }
    for (key,value) in freqMap {
        for _ in 0..<value {
            result.append("\(key)")
        }
    }
    return result
}




//let a1 = ["smitesh", "patel", "khushal", "patel"]
//let a2 = ["pranal", "patel", "khushal", "patel"]

//let a1 = [4,9,9,5]
//let a2 = [9,4,9,8,4]

let a1 = ["bella","label","roller"]


let a = commonChars(a1)
print(a)



