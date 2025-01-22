//
//  MissingNumber.swift
//  
//
//  Created by Nonprawich I. on 21/01/2025.
//

import Foundation

func findMissingNumber(_ array: [Int]) -> Int? {
    guard let maxNum = array.max() else { return nil }
    
    let expectedSum = (maxNum * (maxNum + 1)) / 2
    
    let actualSum = array.reduce(0, +) // use reduce instead of a for-loop for summing
    
    return expectedSum - actualSum
}

let example1 = [2, 1, 5, 6, 11, 8, 9, 3, 4, 7, 10, 12, 14, 15, 16, 17]  // Missing 13
let example2 = [1, 2, 3, 5, 6, 7]  // Missing 4
let example3 = [1, 3, 4, 5, 6, 7, 8, 9, 10]  // Missing 2

print(findMissingNumber(example1) ?? "No missing number")
print(findMissingNumber(example2) ?? "No missing number")
print(findMissingNumber(example3) ?? "No missing number")
