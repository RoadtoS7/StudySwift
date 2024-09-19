//
//  Number3.swift
//  StudySwift
//
//  Created by nylah.j on 9/19/24.
//

import Foundation

final class Number3 {
    func solution(_ playList: [Int], _ listenTime: Int) -> Int {
        // 총 playList 길이
        let playListLength: Int = playList.reduce(0, +)
        // 시간대별 재생중인 재생 중인 곡
        var timeToSong: [Int] = .init(repeating: 0, count: playListLength)
        
        var startTime: Int = 0
        for (i, songLength) in playList.enumerated() {
            let endTime = startTime + songLength
            
            for time in startTime..<endTime {
                timeToSong[time] = i
            }
            
            startTime = endTime
        }
        
        typealias StartTime = Int
        typealias Length = Int
        typealias SongSet = Set<Int>
        
        var maxCountDp: [[SongSet]] = .init()
        
        for _ in 0..<(listenTime+1) {
            let songSet = timeToSong.map { Set([$0]) }
            maxCountDp.append(songSet)
        }
        
        for length in 0..<listenTime {
            for startTime in 0..<playListLength {
                let nextStartTimeIndex = (startTime + 1) % (playListLength - 1)
                maxCountDp[length+1][startTime] = maxCountDp[1][startTime].union(maxCountDp[length][nextStartTimeIndex])
            }
        }
        
        let result =  maxCountDp[listenTime].map { $0.count }.max()!
        
        for (i, arr) in maxCountDp.enumerated() {
            for (j, songSet) in arr.enumerated() {
//                print("\(i) - \(j) : ", songSet)
            }
        }
        
        return result
    }
    
    static func test() {
        [
            ([2, 3, 1, 4], 3),
            ([1, 2, 3, 4], 5),
            ([1, 2, 3, 4], 20),
        ].forEach {
            print("result = ", Number3().solution($0, $1))
        }
        
    }
}
