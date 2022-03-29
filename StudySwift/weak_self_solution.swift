//
//  weak_self_solution.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/15.
//

import Foundation

class StopWatchSolution {
    var elapsedTime: Int = 0
    var timer: Timer?
    
    // weak self를 사용하여 self와 timer closure 간에 strong reference cycle이 발생하지 않는다.
    // weak self를 사용하면 self는 optional type이 된다.
    // b) self가 참조하는 메모리가 해제될 경우 nil값으로 변경되기 때문이다.
    // optional을 사용하고 싶지 않을 때 unowned를 사용한다.
    // unowned는 unowned로 참조하는 인스턴스가 항상 라이프사이클이 더 길때만 사용할 수 있다.
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            self?.elapsedTime += 1
        })
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
