//
//  DynamicProgramming.swift
//  StudySwift
//
//  Created by nylah.j on 9/17/24.
//

import Foundation

final class NExpresssion {
    var answer: Int = -1
    
    func dfs(_ N: Int, _ number: Int, _ currentNumber: Int, _ nCount: Int) {
        if nCount > 8 {
            return
        }
        
        if currentNumber == number, (nCount < answer || answer == -1) {
            answer = nCount
        }
           
        var calc: Int = 0
        
        for i in 0..<8 {
            calc = calc * 10 + N
            dfs(N, number, currentNumber + calc, nCount + i + 1)
            dfs(N, number, currentNumber - calc, nCount + i + 1)
            dfs(N, number, currentNumber * calc, nCount + i + 1)
            dfs(N, number, currentNumber / calc, nCount + i + 1)
        }
    }
    
    func solution(_ N:Int, _ number:Int) -> Int {
        dfs(N, number, 0, 0)
        return answer
    }
    
    static func test() {
        [
            (5,    12),
            (2,   11)
        ].forEach {
            print(NExpresssion().solution($0, $1))
        }
    }
}
