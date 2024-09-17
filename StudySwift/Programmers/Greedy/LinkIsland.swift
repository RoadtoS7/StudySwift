//
//  LinkIsland.swift
//  StudySwift
//
//  Created by nylah.j on 9/17/24.
//

import Foundation

final class LinkIsland {
    var parent = (0...101).compactMap { $0 }
    
    func findRoot(_ node: Int) -> Int {
        if parent[node] != node {
            parent[node] = findRoot(parent[node])
        }
        return parent[node]
    }
    
    func solution(_ n:Int, _ costs:[[Int]]) -> Int {
        var totalCost: Int = 0
        
        
        typealias Bridge = (node1: Int, node2: Int, cost: Int)
        let bridges = costs.map {
            Bridge(node1: $0[0], node2: $0[1], cost: $0[2])
        }.sorted { bridge1, bridge2 in
            bridge1.cost < bridge2.cost
        }
        
        bridges.forEach { (node1: Int, node2: Int, cost: Int) in
            let root1 = findRoot(node1)
            let root2 = findRoot(node2)
            
            if root1 != root2 {
                parent[root2] = root1
                totalCost += cost
            }
        }
        
        return totalCost
    }
    
    static func test() {
        print(LinkIsland().solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))
    }
}
