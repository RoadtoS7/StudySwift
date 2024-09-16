//
//   GymClothSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/16/24.
//

import Foundation

final class GymClotheSolution {
    
    func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        let (lost, reserve) = (Set(lost), Set(reserve))
        
        let common = reserve.filter { lost.contains($0) }
        let newReverse = reserve.subtracting(common)
        let newLost = lost.subtracting(common)
        
        let sortedLost = newLost.sorted(by: >)
        let sortedReverse = newReverse.sorted(by: >)
        var hasCloth: [Int:Bool] = [:]
        
        for i in (0...n) {
            hasCloth[i] = newLost.contains(i) ? false : true
        }
        
        var result: Int = n - sortedLost.count
        
        for reverse in sortedReverse {
            if newLost.contains(reverse - 1), hasCloth[reverse - 1] == false {
                hasCloth[reverse - 1] = true
                result += 1
                continue
            }
            
            if newLost.contains(reverse + 1), hasCloth[reverse + 1] == false {
                hasCloth[reverse + 1] = true
                result += 1
                continue
            }
        }
        
        return result
    }
    
    static func test() {
        [
            (5,    [2, 4],    [1, 3, 5]),
            (5,    [2, 4],    [3]),
            (3,    [3],    [1]),
        ].forEach {
            print(GymClotheSolution().solution($0, $1, $2))
            }
    }
    
}
