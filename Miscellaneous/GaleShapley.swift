//
//  GaleShapley.swift
//  
//
//  Created by Nonprawich I. on 28/1/25.
//

import Foundation

func galeShapley(menPreferences: [String: [String]], womenPreferences: [String: [String]]) -> [String: String] {
    var freeMen = Array(menPreferences.keys) // List of free men
    var engagedPairs = [String: String]()    // Stores woman -> man pairs
    var proposals = [String: Set<String>]()  // Tracks proposals made by each man

    for man in menPreferences.keys {
        proposals[man] = []
    }

    while !freeMen.isEmpty {
        let man = freeMen.removeFirst()  // Pick a free man
        guard let manPrefList = menPreferences[man] else { continue }

        for woman in manPrefList {
            // If the man hasn't proposed to this woman yet
            if !(proposals[man]?.contains(woman) ?? true) {
                proposals[man]?.insert(woman) // Mark as proposed

                if engagedPairs[woman] == nil { // Woman is free
                    engagedPairs[woman] = man
                    break
                } else { // Woman is already engaged
                    let currentPartner = engagedPairs[woman]!
                    guard let womanPrefList = womenPreferences[woman] else { continue }

                    // Check if the woman prefers the new man over her current partner
                    if womanPrefList.firstIndex(of: man)! < womanPrefList.firstIndex(of: currentPartner)! {
                        engagedPairs[woman] = man  // Switch to the new man
                        freeMen.append(currentPartner) // Current partner becomes free
                        break
                    } else {
                        freeMen.append(man) // Man remains free
                        break
                    }
                }
            }
        }
    }

    return engagedPairs
}

// Example usage
let menPreferences = [
    "m1": ["w1", "w2", "w3"],
    "m2": ["w1", "w2", "w3"],
    "m3": ["w1", "w3", "w2"]
]

let womenPreferences = [
    "w1": ["m3", "m2", "m1"],
    "w2": ["m3", "m2", "m1"],
    "w3": ["m2", "m3", "m1"]
]

let matches = galeShapley(menPreferences: menPreferences, womenPreferences: womenPreferences)
print(matches)
