//
//  DiskController.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class DiskController {
    func solution(_ jobs:[[Int]]) -> Int {
        // 1. 요청 시간 순으로 정렬한다.
        let count = jobs.count
        var jobs = jobs.sorted { lhs, rhs in
            (lhs[0]) < (rhs[0])
        }
        
        
        // 현재 시간보다 먼저 요청된 작업을 큐에 추가한다.
        var currentTime = 0
        var completedJobCount = 0
        var queue: [(start: Int, duration: Int)] = []
        var startToEndTimeline: [Int] = []
        
        while completedJobCount < count || queue.isEmpty == false {
            while jobs.isEmpty == false, jobs[0][0] <= currentTime {
                let job = jobs.removeFirst()
                queue.append((start: job[0], duration: job[1]))
            }
            
            // 소요시간이 짧은 것부터 실행
            if queue.isEmpty == false {
                queue.sort { $0.duration < $1.duration }
                let job = queue.removeFirst()
                
                currentTime += job.duration
                startToEndTimeline.append(currentTime - job.start)
                completedJobCount += 1
            } else {
                currentTime = jobs.first![0]
            }
        }
        
        return startToEndTimeline.reduce(0, +) / count
    }
    
    static func test() {
        let controller = DiskController()
        let avg = controller.solution([[0, 3], [1, 9], [2, 6]])
        print("$$ avg: ", avg)
    }
}
