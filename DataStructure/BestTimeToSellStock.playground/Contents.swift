class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        var maxProfit = 0
        var minPrice = 0
        var maxPrice = prices[0]
        // minPrice = 0 and maxPrice = 0
        // What is pro
        for i in 0...prices.count - 1 {
            
            if prices[i] < minPrice {
                minPrice = prices[i]
            }
            if maxPrice > prices[i] {
                maxPrice = prices[i]
            }
        }
        maxProfit = maxPrice - minPrice
        return maxProfit
    }
}


let prices = [7,1,5,3,6,4]

let maxProfit = Solution().maxProfit(prices)
