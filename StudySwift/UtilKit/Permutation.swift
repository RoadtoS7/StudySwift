//
//  Permutation.swift
//  StudySwift
//
//  Created by nylah.j on 8/5/24.
//

import Foundation

final class Permutation {
    static func solution<T>(_ elements: [T], k: Int) -> [[T]] {
        var result: [[T]] = .init()
        var visited: [Bool] = [Bool](repeating: false, count: elements.count)
        
        func permute(_ now: [T]) {
            if now.count == k {
                result.append(now)
                return
            }
            
            for i in 0..<elements.count {
                if visited[i] == true {
                    continue
                }
                
                visited[i] = true
                permute(now + [elements[i]])
                visited[i] = false
            }
        }
        
        permute([])
        return result
    }
}
