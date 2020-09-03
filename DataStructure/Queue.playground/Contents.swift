protocol Queue {
    
    associatedtype Element
    mutating func enqueue(_ elemnt: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}


struct Stack<Element> {
    
    private var storage: [Element] = []
    
    init() {}
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    func peek() -> Element? {
        return storage.last
    }
    
    var isEmpty: Bool {
        return peek() == nil
    }
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        let topDivider = "-------top---------\n"
        let bottomDivider = "\n ----------------"
        let stackElements = storage.map { "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}


struct QueueArray<T>: Queue {
    
    var array: [T] = []
    init() {}
    
    var isEmpty: Bool { return array.isEmpty }
        
    var peek: T? { return array.first }
     
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    
    var description: String {
        return array.description
    }
}

var queue = QueueArray<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue.dequeue()
queue
queue.peek
print(queue)






