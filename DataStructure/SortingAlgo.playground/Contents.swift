import UIKit


public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    guard array.count >= 2 else {
        return
    }
    
    for end in (1..<array.count).reversed() {
        var swapped = false
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current+1)
                swapped = true
                
            }
        }
        if !swapped {
            return
        }
    }
}
// Average time complexity on O(n2)

public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else {
        return
    }
    
    for current in 0..<array.count - 1 {
        var lowest = current
        
        for other in current + 1..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else {
        return
    }
    
    for current in 1..<array.count {
        for shift in (1...current).reversed() {
            if array[shift] < array[shift - 1] {
                array.swapAt(shift, shift - 1)
            } else {
                break
            }
        }
     }
}

public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count/2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    return merge(left, right)
}

// O(n log n) time and space complexity

public func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var result:[Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if  leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
        
        if leftIndex < left.count {
            result.append(contentsOf: left[leftIndex...])
        }
        
        if rightIndex < right.count {
            result.append(contentsOf: right[rightIndex...])
        }
        print(result)
    }
    return result
}




// Insertion Sort O(n) if data is already sorted

var array = [9,4,10, 3, 5]
print("Original: \(array)")
bubbleSort(&array)
print("Bubble sorted: \(array)")
selectionSort(&array)
print("Selection sorted: \(array)")
insertionSort(&array)
print("Insertion sorted: \(array)")

mergeSort(array)
print("Merge sorted: \(array)")
