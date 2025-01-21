//
//  MissingNumber.swift
//  
//
//  Created by Nonprawich I. on 21/01/2025.
//

import Foundation

let exampleArray = [2, 1, 5, 6, 11, 8, 9, 3, 4, 7, 10, 12, 14, 15, 16, 17] // The missing number is actually 13 here.

print(exampleArray.count)

let biggestNumber = exampleArray.max()
print("\(biggestNumber ?? 0)")

var sum: Int = 0

for i in 0..<exampleArray.count {
    sum += exampleArray[i]
}

if let biggestNumber {
    var computedNumber: Int {
      (biggestNumber * (biggestNumber + 1)) / 2
    }
    
    print(computedNumber)
    
    print("The missing number is \(computedNumber-sum)")
}
