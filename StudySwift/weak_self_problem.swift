//
//  weak_self.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/15.
//

import Foundation

class StopWatch {
    
    var elapsedTime: Int = 0
    var timer: Timer?
    
    func start() {
        // closure는 self를 강한 참조한다.
        // self는 timer를 강한 참조 한다.
        // -> timer closure와 self간에 strong reference cycle이 발생한다.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.elapsedTime += 1
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil // start()에서 timer와 self간에 strong refrence cycle이 발생했으므로 Timer 인스턴스의 메모리 leak 발생
    }
}
