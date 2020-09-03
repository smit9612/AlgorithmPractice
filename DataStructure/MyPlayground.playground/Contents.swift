/// Linked List Node Declaration
class Node<T> {
    
    var value: T
    var next: Node?
    var prev: Node?
    
    init(value: T, next: Node? = nil, prev: Node? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> \(String(describing: next))"
    }
}

struct LinkList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    init() {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    var count: Int {
        
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return node
    }
    
    mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: T) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    func node(at index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil, currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        /// if inserting at end it should this value
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    mutating func removeLast() -> T? {
        
        // check if link only has 1
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkList: CustomStringConvertible {
    
    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkList: Collection {
    
    struct Index: Comparable {
        var node: Node<T>?
        
        static func ==(lhs: Index, rhs:Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let( left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    var startIndex: Index { return Index(node: head) }
    // 2
    var endIndex: Index { return Index(node: tail?.next) }
    // 3
    func index(after i: Index) -> Index { return Index(node: i.node?.next) }
    // 4
    subscript(position: Index) -> T { return position.node!.value
    }
}

func creatLinkedListPush() {
    
    var list = LinkList<Int>()
    print(list)
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before Pop")
    print(list)
    list.pop()
    print("After Pop")
    print(list)
    list.removeLast()
    print("After Remove last node")
    print(list)
}

func creatLinkedListAppend() {
    print("Example of Append")
    var list = LinkList<Int>()
    
    list.append(3)
    list.append(2)
    list.append(1)
    print(list)
}

func creatLinkedListInsert() {
    print("inserting at a particular index")
    var list = LinkList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before inserting: \(list)")
    var middleNode = list.node(at: 1)!
    for _ in 1...4 {
        middleNode = list.insert(-1, after: middleNode)
    }
    print("After inserting: \(list)")
}

creatLinkedListPush()
creatLinkedListAppend()
creatLinkedListInsert()
