import UIKit

//Given an array representing heights of buildings. The array has buildings from left to right as shown in below diagram, count number of buildings facing the sunset. It is assumed that heights of all buildings are distinct.
// e.g input is [9,4,6,2,1] output will be [5,4,3,1]

func countBuildings(_ array: [Int], count: Int) -> [Int] {
    
    var curr_max = array[count]
    var result:[Int] = [count + 1]
    var i = count
    while i >= 0 {
        if array[i] > curr_max {
            result.append(i+1)
            curr_max = array[i]
        }
        i -= 1
    }
    print(result)
    return result
}

let array = [9,10,6,2,1]
countBuildings(array, count: array.count - 1)








