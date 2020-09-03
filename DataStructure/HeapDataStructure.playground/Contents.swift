
struct Heap<Element: Equatable> {
    
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        if !elements.isEmpty {
            for i in stride(from: ((elements.count/2) - 1), through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
}

extension Heap {
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2*index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        leftChildIndex(ofParentAt: index) + 1
    }

    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // The overall complexity of remove() is O(log n).Swapping elements in an array takes only O(1), while sifting down elements in a heap takes O(log n) time.
    
    mutating func remove() -> Element? {
        
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }
    
    
    
    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < candidate && sort(elements[right], elements[candidate]) {
                candidate = right
            }
             if candidate == parent {
                  return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    //Complexity: The overall compexity of insert(_:) is O(log n). Appending an element in an array takes only O(1), while sifting up elements in a heap takes O(log n)
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
          return nil // 1
        }
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    func index(of element: Element, staringAt i: Int) -> Int? {
        if i >= count, sort(element, elements[i]) {
            return nil
        }
        if element == elements[i]{
            return i
        }
        if let j = index(of: element, staringAt: leftChildIndex(ofParentAt:i)) {
            return j
        }
        if let j = index(of: element, staringAt: rightChildIndex(ofParentAt:i)) {
            return j
        }
        return  nil
    }
}


var heap = Heap(sort: <, elements: [1,12,3,4,1,6,8,7])
while !heap.isEmpty {
    print(heap.remove()!)
}

