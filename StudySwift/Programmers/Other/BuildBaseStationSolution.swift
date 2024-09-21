//
//  BuildBaseStationSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/21/24.
//

import Foundation

final class BuildBaseStationSolution {
    func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
        let stationCount = stations.count
        
        var result: Int = 0
        for i in 0...stationCount {
            let lengthStart =  i < stationCount ? stations[i] - w : n + 1
            if lengthStart <= 1 {
                continue
            }
            
         
            let emptyStart = i == .zero ? 1 : stations[i - 1] + w + 1
            let emptyEnd = emptyStart + 1 + w
            if emptyStart >= lengthStart {
                continue
            }

            let emptyCount = lengthStart - emptyStart
            let length = 2 * w + 1
            let minBuiltCount = Int(ceil(Double(emptyCount) / Double(length)))
            result += minBuiltCount
        }
        
        return result
    }
    
    func solution2(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
        var result = 0
        var current = 1
        var sIndex = 0
        
        while current <= n {
            if sIndex < stations.count && current >= stations[sIndex] - w {
                current = stations[sIndex] + w + 1
                sIndex += 1
            } else {
                result += 1
                current += (2 * w + 1)
            }
        }
        return result
    }
    
    static func test() {
        [
            (11,    [4, 11],    1),
            (16,    [9],    2)
        ].forEach {
            print(BuildBaseStationSolution().solution($0, $1, $2))
        }
    }
}
