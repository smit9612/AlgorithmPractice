

import Foundation

    
    func findBusiestPeriod(data: [[Int]]) -> Int {

    var maxTimeStamp = 0
    var currTime = data[0][0]
    var currVisitors = data[0][2] == 1 ? data[0][1] : -data[0][1]
    var maxVisitors = -1
    guard data.count > 1 else { return currTime }
    for i in 1...data.count - 1 {
    if data[i][0] == currTime {
        currVisitors += data[i][2] == 1 ? data[i][1] : -data[i][1]
    } else {
      // if currVisitor greater than maxVisitor
      if currVisitors > maxVisitors {
        maxVisitors = currVisitors
        maxTimeStamp = currTime
      }
        currVisitors += data[i][2] == 1 ? data[i][1] : -data[i][1]
        currTime = data[i][0]
    }
    }

    if (currVisitors > maxVisitors) {
        maxVisitors = currVisitors
        maxTimeStamp = currTime
    }

    return maxTimeStamp
    }


let data = [[1487799425, 14, 1],
[1487799425, 4,  0],
[1487799425, 2,  0],
[1487800378, 10, 1],
[1487801478, 18, 0],
[1487801478, 18, 1],
[1487901013, 1,  0],
[1487901211, 7,  1],
[1487901211, 7,  0] ]

let maxTimeStamp = findBusiestPeriod(data: data)
print("Max TimeStamp is \(maxTimeStamp)")






