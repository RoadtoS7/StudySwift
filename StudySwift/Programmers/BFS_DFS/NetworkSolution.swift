//
//  NetworkSolution.swift
//  StudySwift
//
//  Created by nylah.j on 8/17/24.
//

import Foundation

final class NetworkSolution {
    var networkIndexes: [Int] = []

    func solution(_ n:Int, _ computers:[[Int]]) -> Int {
        networkIndexes = .init(repeating: -1, count: n)
        
        var count: Int = 0
        
        for i in 0..<n {
            if networkIndexes[i] == -1 {
                print("$$ startIndex: ", i)
                bfs(startIndex: i, computers: computers)
                count += 1
            }
        }
        
        return count
    }
    
    func bfs(startIndex: Int, computers: [[Int]]) {
        var needToVisit: [Int] = [startIndex]
        
        repeat {
            guard let currentIndex = needToVisit.popLast() else {
                break
            }
            
            for (index, value) in computers[currentIndex].enumerated() {
                guard value == 1 else {
                    continue
                }
                guard index != currentIndex else {
                    networkIndexes[index] = startIndex
                    continue
                }
                
                guard networkIndexes[index] == -1 else {
                    continue
                }

                networkIndexes[index] = startIndex
                
                if value == 1 {
                    needToVisit.append(index)
                }
            }
        } while (needToVisit.isEmpty == false)
    }
    
    func solutionDFS(_ n:Int, _ computers:[[Int]]) -> Int {
        var visited: [Bool] = .init(repeating: false, count: n)
        var result: Int = 0
        
        func bfs(index: Int) {
            visited[index] = true
            
            for i in 0..<n {
                // 차례대로 검사해야 한다.
                if computers[index][i] == 1, visited[i] == false {
                    bfs(index: i)
                }
            }
        }
        
        for i in 0..<n {
            if visited[i] == false {
                result += 1
                bfs(index: i)
            }
        }
        
        return result
    }
}
