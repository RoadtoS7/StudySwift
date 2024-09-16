//
//  DivideNetwork.swift
//  StudySwift
//
//  Created by nylah.j on 8/12/24.
//

import Foundation

final class DivideNetwork {
    func solution(_ n:Int, _ wires:[[Int]]) -> Int {
        var network: [Int: Array<Int>] = .init()
        var minCount: Int = .max
        
        for wire in wires {
            let (node1, node2) = (wire[0], wire[1])
            
            if let network1 = network[node1] {
                network[node1] = network1 + [node2]
            } else {
                network[node1] = [node2]
            }
            
            if let network2 = network[node2] {
                network[node2] = network2 + [node1]
            } else {
                network[node2] = [node1]
            }
        }
        
        func visit(_ x: Int, visited: inout [Bool], notVisit: Int) {
            visited[x] = true
            for node in (network[x] ?? []) {
                if node == notVisit {
                    continue
                }
                if visited[node] == false {
                    visit(node, visited: &visited, notVisit: notVisit)
                }
            }
        }

        // 제거할 거를 선택한다.
        for wire in wires {
            // 제거한다.
            var visited: [Bool] = .init(repeating: false, count: n + 1)
            let (node1, node2) = (wire[0], wire[1])
        
            visit(node1, visited: &visited, notVisit: node2)
            let node1NetworkCount: Int = visited.filter { $0 == true }.count
            let node2NetworkCount: Int = visited.filter { $0 == false }.count - 1
        
            let diff = abs(node1NetworkCount - node2NetworkCount)
            minCount = min(minCount, diff)
        }
        
        
        return minCount
    }
    
    var network: [Array<Int>] = []
    var visited: [Bool] = []
    var result: Int = .max
    
    func solution2(_ n:Int, _ wires:[[Int]]) -> Int {
        network = .init(repeating: [], count: n + 1)
        
        // network 구성
        for wire in wires {
            network[wire[0]].append(wire[1])
            network[wire[1]].append(wire[0])
        }
        
        
        // 뺄 것을 정한다.
        // 노드 한개를 이미 방문했다고 가정한다.
        for i in 1...n {
            visited = .init(repeating: false, count: n + 1)
            visited[i] = true
            let count = dfs(1)
            let curResult = abs(count - (n - count))
            result = min(result, curResult)
        }
        
        return result
    }
    
    func dfs(_ start: Int) -> Int {
        var count: Int = .zero
        
        for nodes in network[start] {
            if visited[nodes] == false {
                visited[nodes] = true
                count += (1 + dfs(nodes))
            }
        }
        
        return count
    }
    
//    func solution3(_ n:Int, _ wires:[[Int]]) -> Int {
//        // 전력망을 하나 없앤다.
//        // 탐색하면서 개수를 센다.
//        // 개수 차이를 얻어서 max값을 구한다.
//        let network = makeNetwork(wires)
//    
//    }
//    
//    private func makeNetwork(_ wires: [[Int]]) -> [Int: [Int]] {
//        var result = [Int:[Int]]()
//        for wire in wires {
//            let (start, end) = (wire[0], wire[1])
//            result[start, default: []].append(end)
//            result[end, default: []].append(start)
//        }
//        return result
//    }
//    
//    private func traverse(_ network: [Int: [Int]]) {
//        var needToVisit: [Int] = network.values.first!
//        let (exStart, exEnd) = (excluded[0], excluded[1])
//        
//        while needToVisit.isEmpty == false {
//            let start = needToVisit.popLast()
//            
//            for end in network[start] {
//                if visited[]
//                
//                
//                
//            }
//        }
//        
//    }
}
