//
//  CarpetSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/16/24.
//

import Foundation

final class CarpetSolution {
    func solution(_ brown:Int, _ yellow:Int) -> [Int] {
        for w in 1...yellow {
            let h = yellow / w
            let namujee = yellow % w
            
            guard namujee == 0, w >= h else {
                continue
            }
            
            let carpetWidth = w + 2
            let carpetHeight = h + 2
            let brownCount = (carpetWidth * carpetHeight - yellow)
            if brownCount == brown {
                return [carpetWidth, carpetHeight]
            }
        }
        
        return []
    }
    
    static func test() {
        [
            (10, 2),
            (8, 1),
            (24, 24),
        ].forEach { b, y in
            print(CarpetSolution().solution(b, y))
        }
    }
}
