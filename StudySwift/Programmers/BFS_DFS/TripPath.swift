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
    
    private var totalTicketCount: Int = 0
    private var network2: [String:[String]] = [:]
    private var ticketCount: [String:Int] = [:]
    private var result: [String] = []
    
    func solution2(_ tickets:[[String]]) -> [String] {
        totalTicketCount = tickets.count
        
        for ticket in tickets {
            let (from, to) = (ticket[0], ticket[1])
            network2[from, default: []].append(to)
            let ticketKey: String = "\(from)\(to)"
            ticketCount[ticketKey, default: 0] += 1
        }
        
        
        for node in network2.keys {
            network2[node]?.sort(by: <)
        }
        
        dfs(from: "ICN", path: ["ICN"], visitCount: 0)
        
        return result
    }

    private func dfs(from: String, path: [String], visitCount: Int) {
        if visitCount == totalTicketCount && result.isEmpty {
            result = path
            return
        }
        
        
        for to in network2[from, default: []] {
            if from == "ATL" {
                print(to)
            }
            
            guard ticketCount["\(from)\(to)", default: 0] > 0 else {
                continue
            }
            
            ticketCount["\(from)\(to)", default: 0] -= 1
            dfs(from: to, path: path + [to], visitCount: visitCount + 1)
            ticketCount["\(from)\(to)", default: 0] += 1
        }
    }
    
    func solution5(_ tickets:[[String]]) -> [String] {
        var network: [String:[String]]  = [:]
        var result: [String] = []
        var ticketCount: [String:Int] = [:]
        
        for ticket in tickets {
            let (from, end) = (ticket[0], ticket[1])
            network[from, default: []].append(end)
            ticketCount["\(from)\(end)", default: 0] += 1
        }
        
        for key in network.keys {
            network[key, default: []].sort(by: <)
        }
        
        func dfs(from: String, path: [String], ticketCount: [String:Int]) {
            if ticketCount.values.reduce(0, +) == .zero, result.isEmpty {
                result = path
                return
            }
            
            for to in network[from, default: []] {
                let key = "\(from)\(to)"
                if ticketCount[key, default: 0] > 0 {
                    var ticketCount = ticketCount
                    ticketCount[key, default: 0] -= 1
                    dfs(from: to, path: path + [to], ticketCount: ticketCount)
                    ticketCount[key, default: 0] += 1
                }
            }
        }
        
        dfs(from: "ICN", path: ["ICN"], ticketCount: ticketCount)
        return result
    }
    
    static func test() {
        [
//            [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]],
            [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
        ].forEach {
            print(TripPath().solution5($0))
        }
    }
}

