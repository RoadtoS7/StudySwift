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
            guard allUsed["\(from)\(fromTo)"] == false else {
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
    
    func solution2(_ tickets:[[String]]) -> [String] {
        ticketCount = tickets.count
        
        for ticket in tickets {
            let (from, to) = (ticket[0], ticket[1])
            network2[from, default: []].append(to)
            let ticketKey: String = "\(from)\(to)"
            ticketUsed[ticketKey] = false
        }
        
        
        for node in network.keys {
            network2[node]?.sort(by: >)
        }
        
        dfs(from: "ICN", path: ["ICN"], visitCount: 0)
        
        return result
    }

    private var ticketCount: Int = 0
    private var network2: [String:[String]] = [:]
    private var ticketUsed: [String:Bool] = [:]
    private var result: [String] = []
    
    private func dfs(from: String, path: [String], visitCount: Int) {
        if visitCount == ticketCount {
            result = path
            return
        }
        
        var ticketUsed = ticketUsed
        
        for to in network2[from, default: []] {
            if from == "ATL" {
                print(to)
            }
            
            guard ticketUsed["\(from)\(to)"] == false else {
                continue
            }
            
            ticketUsed["\(from)\(to)"] = true
            dfs(from: to, path: path + [to], visitCount: visitCount + 1)
            ticketUsed["\(from)\(to)"] = false
        }
    }
    
    static func test() {
        [
            //            [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]],
            [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
        ].forEach {
            print(TripPath().solution2($0))
        }
    }
}

