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

var stack = Stack<String>()
print(stack.isEmpty)
stack.push("Smitesh")
stack.push("Amay")
stack.push("Visha")

print(stack)
stack.pop()
print(stack)

