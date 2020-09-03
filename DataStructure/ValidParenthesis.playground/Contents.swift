
class ValidParentheses {
    
     func longestValidParenthesis(_ s: String) -> Int {
        
        var stack = [Int](), longest = 0, start = 0
        for (i, char) in s.enumerated() {
            print(stack)
            if char == "(" {
                stack.append(i)
            } else {
                if !stack.isEmpty {
                    stack.removeLast()
                    if let last = stack.last {
                        longest = max(longest, i - last)
                    } else {
                        longest = max(longest, i - start + 1)
                    }
                } else {
                    start = i + 1
                }
            }
        }
        return longest
    }
    
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else if char == ")" {
                guard stack.count != 0 && stack.removeLast() == "(" else {
                    return false
                }
            } else if char == "]" {
                guard stack.count != 0 && stack.removeLast() == "[" else {
                    return false
                }
            } else if char == "}" {
                guard stack.count != 0 && stack.removeLast() == "{" else {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}

let string = "((()()))))"

print(ValidParentheses().longestValidParenthesis(string))


   
