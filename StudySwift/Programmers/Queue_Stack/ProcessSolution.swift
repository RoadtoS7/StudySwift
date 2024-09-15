//
//  ProcessSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/15/24.
//

import Foundation

final class ProcessSolution {
    func solution(_ priorities:[Int], _ location:Int) -> Int {
        typealias Index = Int
        typealias Priority = Int
        typealias IndexPriority = (index: Index, p: Priority)
        
        // queue 구성
        var queue: [IndexPriority] = priorities.enumerated()
            .map { index, p in
                (index: index, p: p)
            }
        
        var count = 0
        while queue.isEmpty == false {
            let maxPriority: Priority = queue.max { $0.p < $1.p }!.p
            
            let (index, p): IndexPriority = queue.removeFirst()
            
            if p == maxPriority {
                count += 1
                
                if index == location {
                    break
                }
            } else {
                queue.append((index, p))
            }
        }
        
        return count
    }
    
    static func test() {
        [
            ([2, 1, 3, 2] ,   2),
            ([1, 1, 9, 1, 1, 1],    0)
        ].forEach { 
            let result = ProcessSolution().solution($0.0, $0.1)
            print("$$ result", result)
        }
        
    }
}
