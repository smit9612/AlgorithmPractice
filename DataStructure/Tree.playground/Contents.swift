

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueStack<T> : Queue {

    private var leftStack: [T] = []
    private var rightStack: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.last: rightStack.last
    }
    
    @discardableResult
    mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    
    public var description: String {
        let printList = leftStack + rightStack.reversed()
        return printList.description
    }
}



class TreeNode<T> {

    var value: T
    var children: [TreeNode] = []

    init(_ value: T) {
        self.value = value
    }

    func addChild(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }

    func forEachDFS(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDFS(visit: visit)
        }
    }
    
    func forEachLevelOrder(visit:(TreeNode) -> Void) {
        visit(self)
        var queue = QueueStack<TreeNode>()
        children.forEach { queue.enqueue($0)}
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0)}
        }
    }
}

extension TreeNode where T: Equatable {
    
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

let tree = TreeNode<String>("beverages")

let hotNode = TreeNode<String>("hot")
let coldNode = TreeNode<String>("cold")

let teaNode = TreeNode<String>("tea")
let coffeeNode = TreeNode<String>("coffee")
let chocolateNode = TreeNode<String>("cocoa")

let blackTeaNode = TreeNode<String>("black")
let greenTeaNode = TreeNode<String>("green")
let chaiTeaNode = TreeNode<String>("chai")

let sodaNode = TreeNode<String>("soda")
let milkNode = TreeNode<String>("milk")

let gingerAleNode = TreeNode<String>("ginger ale")
let bitterLemonNode = TreeNode<String>("bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)

//tree.forEachDFS { print($0.value) }

//tree.forEachLevelOrder { print ($0.value) }




//////// ///////// Binary Node /// Binary Node


class BinaryNode<T> {
    
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
    
    public init(value: T) {
        self.value = value
    }
    
    func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (T) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (T) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

extension BinaryNode: CustomStringConvertible {
    
    var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,_ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "| ")
        + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "| ", bottom + "└──", bottom + " ")
    }
}


var binarytree: BinaryNode<Int> {
  let zero = BinaryNode(value: 0)
  let one = BinaryNode(value: 1)
  let five = BinaryNode(value: 5)
  let seven = BinaryNode(value: 7)
  let eight = BinaryNode(value: 8)
  let nine = BinaryNode(value: 9)
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    return seven
}
//print("Tree algo")
//print(binarytree)
//
//print ("Inorder tree")
//print(binarytree.traverseInOrder { print($0) })
//
//print ("PreOrder tree")
//print(binarytree.traversePreOrder { print($0) })
//
//print ("PostOrder tree")
//print(binarytree.traversePostOrder { print($0) })



//////// BINARY SEARCH /////////////
// MARK: - BINARY SEARCH TREE

struct BinarySearchTree<T: Comparable> {
    
    private(set) var root: BinaryNode<T>?
    
    init() { }
}

extension BinarySearchTree {
    
    var description: String {
        return root?.description ?? "empty tree"
    }
}

extension BinarySearchTree {
    
    mutating func insert(_ value : T) {
        root = insert(from: root, value: value)
    }
    
    mutating func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
        // If node is nil return BinaryNode
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
    
    func contains(_ value: T) -> Bool {
        
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            
            if node.value < value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}


extension BinarySearchTree {
    
    mutating func remove(_ value: T) {
        root = remove(node: root, value: value)
    }
    
    mutating func remove(node: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
        
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: value)
            
            
        } else if  value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}


extension BinarySearchTree {

    func findInOrderSucesssor(rootNode: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
        var root = rootNode
        var res:BinaryNode<T>? = nil
        // Inorder success is successor when you remove candidate
        while (root != nil) {
            
            if root!.value > value {
                res = root
                root = root?.leftChild
            } else {
                root = root?.rightChild
            }
        }
        return res
        
    }
        
}




var bst = BinarySearchTree<Int>()
bst.insert(20)
bst.insert(8)
bst.insert(22)
bst.insert(4)
bst.insert(12)
bst.insert(10)
bst.insert(14)
print(bst.findInOrderSucesssor(rootNode: bst.root, value: 8)?.value)


//try reconnecting
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
  
    public func inOrderTraversal(num: Int, visit:(Int) -> Void){
      visit(value)
      if value > num {
        left?.inOrderTraversal(num: num, visit:visit)
      } else {
        right?.inOrderTraversal(num: num,visit:visit)
      }
      
    }
}


func findLargestSmallerKey(rootNode: Node, num: Int) -> Int {
    // your code goes here
    var maxValue = -1
    
    rootNode.inOrderTraversal(num: num) { value in
       if (value < num ) {
         maxValue = max(value, maxValue)
       }
    }
    return maxValue
    
}

let array = [20,9,25,5,12,11,14]
let bts = Node.init(array: array)

var maxValue = findLargestSmallerKey(rootNode:bts, num:14)
//print(maxValue)

