//
//  TripPath.swift
//  StudySwift
//
//  Created by nylah.j on 8/19/24.
//

import Foundation

final class TripPath {
    var network: [String:[String]] = [:]
    var allUsed: [String:Bool] = [:]
    
    func solution(_ tickets:[[String]]) -> [String] {
        
        for ticket in tickets {
            let (from, to) = (ticket[0], ticket[1])
            allUsed["\(from)\(to)"] = false
            
            if let arr = network[from] {
                network[from] = arr + [to]
            } else {
                network[from] = [to]
            }
        }
        
        for (key, value) in network {
            network[key] = value.sorted(by: >)
        }
        
        
        let start: String = "ICN"
        let result = call(from: start, result: [])
        return result
    }
    
    private func call(from: String, result: [String]) -> [String] {
        let newResult: [String] = result + [from]
        
        guard let fromTo = network[from] else {
            return []
        }
        
        for dest in fromTo {
            guard allUsed["\(from)\(fromTo)"] == false {
                continue
            }
            
            let output = call(from: dest, result: newResult)
            if output.isEmpty == false {
                return output
            }
            if allUsed["\(from)\(fromTo)"] == false {
                let output = call(from: dest, result: newResult)
                if output.isEmpty == false {
                    return output
                }
            } else {
                let result = allUsed.values.reduce(true) { $0 && $1 }
                if result == true {
                    return newResult
                }
                else {
                    return []
                }
            }
        }
        
        return []
    }
}
