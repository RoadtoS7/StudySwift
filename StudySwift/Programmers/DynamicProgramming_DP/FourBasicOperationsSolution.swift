//
//  FourBasicOperationsSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/17/24.
//

import Foundation

final class FourBasicOperationsSolution {
    func solution(_ array:[String]) -> Int {
        
        let n: Int = array.count / 2 + 1
        
        var maxDP = Array(repeating: Array(repeating: Int.min, count: n), count: n)
        var minDP = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        
        for i in 0..<n {
            maxDP[i][i] = Int(array[2*i])!
            minDP[i][i] = Int(array[2*i])!
        }
        
        // length = 이용할 연산자 개수
        for length in (1..<n) {
            for i in (0..<n - length) {
                // j = 범위 숫자
                let j = i + length
                
                // k = 연산자 index
                for k in i..<j {
                    let op = array[2 * k + 1]
                    let leftMaxDp = maxDP[i][k]
                    let rightMaxDp = maxDP[k+1][j]
                    let leftMinDp = minDP[i][k]
                    let rightMinDp = minDP[k+1][j]
                    
                    if op == "+" {
                        maxDP[i][j] = max(maxDP[i][j], leftMaxDp + rightMaxDp)
                        minDP[i][j] = min(minDP[i][j], leftMinDp + rightMinDp)
                    } else {
                        maxDP[i][j] = max(maxDP[i][j], leftMaxDp - rightMinDp)
                        minDP[i][j] = min(minDP[i][j], leftMinDp - rightMaxDp)
                    }
                }
            }
        }
        
        return maxDP[0][n-1]
    }
    
    static func test() {
        [
            ["1", "-", "3", "+", "5", "-", "8"],
            ["5", "-", "3", "+", "1", "+", "2", "-", "4"]
        ].forEach {
            print(FourBasicOperationsSolution().solution($0))
        }
    }
}
