import UIKit
///a = 9 b = -2 or b = 2
///
///
/// O(b)
///
func myPow(x: Double, n: Int) -> Double {
    // negative n value should return
    if n < 0 && x != 0 {
        return myPow(x: 1/x, n: n * -1)
    }
    
    if n == 0 {
        return 1
    }
    
    if n == 1 {
        return x
    }
    // if its even
    if n % 2 == 0 {
        let res = myPow(x: x, n: n/2)
        return res * res
    } else {
        return myPow(x: x, n: n - 1) * x
    }
}


//print(myPow(x: 3, n: 0))
//print(myPow(x: 3, n: 1))
//print(myPow(x: 3, n: 2))
print(myPow(x: 2, n: -3))
//print(myPow(x: 3, n: 3))


/// Given a array of integers find maximum subarray sum
///
/// [ -2. -3, 4, -1, -2, 1, 5, -3]
///

/// brute force

func maxSubArray(_ array: [Int] ) {
    let maximumSum = 0
    
}
