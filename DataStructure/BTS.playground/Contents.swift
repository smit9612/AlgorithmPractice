import Foundation

public class Node {
    
    private(set) public var value: Int
    private(set) public var parent: Node?
    private(set) public var left: Node?
    private(set) public var right: Node?
    
    public init(_ value: Int) {
        self.value = value
    }
    
    public func insert(_ value: Int) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                left = Node(value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                right = Node(value)
                right?.parent = self
            }
        }
    }
    
    public convenience init(array: [Int]) {
        precondition(array.count > 0)
        self.init(array.first!)
        for v in array.dropFirst() {
            insert(v)
        }
    }
  
    public func inOrderTraversal(visit:(Int) -> Void){
      left?.inOrderTraversal(visit:visit)
      visit(value)
      right?.inOrderTraversal(visit:visit)
    }
}


func findLargestSmallerKey(rootNode: Node, num: Int) -> Int {
    // your code goes here
    let maxValue = -1
    rootNode.inOrderTraversal {  print($0) }
    return maxValue
    
}

