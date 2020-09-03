import UIKit
// Trie is called prefix tree.

public class TrieNode<Key: Hashable> {
    
    public var key: Key?
    public weak var parent: TrieNode?
    public var children: [Key: TrieNode] = [:]
    public var isTerminating = false
    
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}

// Trie class is build for all types that adopt colleciton protocol including String,
public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    
    public typealias Node = TrieNode<CollectionType.Element>
    private let root = Node(key: nil, parent: nil)
    public init() {}
}

extension Trie  {
    
    public func insert (_ collection: CollectionType) {
        // current keeps track of traversal progress which start with root
        var current = root
        // e.g let collection is cute
        for element in collection {
            // root children of element C  root childrent is C , and current = C and add U as children of currnt
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        current.isTerminating = true
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
    
    public func remove(_ collection: CollectionType) {
        
        var current = root
        for element in collection {
            guard let child = current.children[element] else { return }
            current = child
        }
        guard current.isTerminating else { return }
        current.isTerminating = false
        // remove cut should just make t node isTermainating false
        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
            
            parent.children[current.key!] = nil
            current = parent
        }
    }
}

// PREFIX Matching
public extension Trie where CollectionType: RangeReplaceableCollection {
    
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        for element in prefix {
            guard let child = current.children[element] else { return [] }
            current = child
        }
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        var results: [CollectionType] = []
        if node.isTerminating {
            results.append(prefix)
        }
        
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf: collections(startingWith: prefix, after: child))
        }
        return results
    }
}

let trie = Trie<String>()
//trie.insert("cute")
//trie.insert("cut")
//print("\n*** Before removing ***")
//assert(trie.contains("cut"))
//print("\"cut\" is in the trie")
//assert(trie.contains("cute"))
//print("\"cute\" is in the trie")
//print("\n*** After removing cut ***")
//trie.remove("cut")
//assert(!trie.contains("cut"))
//assert(trie.contains("cute"))
//print("\"cute\" is still in the trie")


trie.insert("car")
trie.insert("card")
trie.insert("care")
trie.insert("cared")
trie.insert("cars")
trie.insert("carbs")
trie.insert("carapace")
trie.insert("cargo")
print("\nCollections starting with \"car\"")
let prefixedWithCar = trie.collections(startingWith: "card")
print(prefixedWithCar)


