//
//  isPrime.swift
//  
//
//  Created by Nonprawich I. on 21/01/2025.
//

import Foundation

func isPrime(n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    
    if n <= 3 {
        return true
    }
    
    // Only need to check up to sqrt(n)
    let sqrtN = Int(Double(n).squareRoot())
    for i in 2...sqrtN {
        if n % i == 0 {
            return false
        }
    }
    
    return true
}

print(isPrime(n: 971)) // return true
print(isPrime(n: 972)) // return false
