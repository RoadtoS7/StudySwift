//
//  Number2.swift
//  StudySwift
//
//  Created by nylah.j on 9/19/24.
//

import Foundation

final class Number2 {
    func solution(_ mvp: [[Int]]) -> [Int] {
        let playerCount = mvp[0].count
        var dayMvpCount: [Int:Int] = [:]
        
        for oneWeekVote in mvp {
            var voteCount: [Int:Int] = [:]
            
            for player in oneWeekVote {
                voteCount[player, default: .zero] += 1
            }
            
            let (_, maxVoteCount) = voteCount.max {
                $0.value < $1.value
            }!
            
            voteCount.keys.filter { key in
                voteCount[key] == maxVoteCount
            }.forEach { player in
                dayMvpCount[player, default: 0] += 1
            }
        }
        
        var result: [Int] = []

        let (_, maxDayMvpCount) = dayMvpCount.max {
            $0.value < $1.value
        }!
        
        for (player, voteCount) in dayMvpCount {
            if voteCount == maxDayMvpCount {
                result.append(player)
            }
        }
        return result.sorted()
        
    }
    static func test() {
        [
            [
                [2, 1, 1, 3], [2, 3, 4, 2], [3, 3, 2, 3], [4, 1, 1, 3]
            ],
            [
                [3, 3, 2, 2], [4, 3, 2, 1], [3, 1, 2, 3]
            ],
            [
                [2, 1, 1, 2, 3], [2, 3, 2, 3, 4], [5, 4, 4, 3, 3]
            ],
            [
                [4, 1, 1, 1], [2, 3, 2, 2], [3, 3, 1, 3], [4, 4, 4, 2]
            ],
        ].forEach {
            print(Number2().solution($0))
        }
        
    }
}
