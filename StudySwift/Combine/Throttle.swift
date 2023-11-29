//
//  Throttle.swift
//  StudySwift
//
//  Created by nylah.j on 11/16/23.
//

import Foundation
import Combine

/*
 Combine의 throttle은 Rx의 throttle과 다르다
 Combine의 throttle
 정해진 시간 동안 upstream이 발행된 데이터 중 가장 최신 것 or 가장 첫번째 것
 */

final class ThrottleTest {
    var cancellables: Set<AnyCancellable> = .init()
    var cancellable: AnyCancellable?
    
    func test() {
        cancellable = Timer.publish(every: 3.0, on: .main, in: .default)
            .autoconnect()
            .print("\(Date().description)")
            .throttle(for: 10.0, scheduler: RunLoop.main, latest: true)
            .sink(
                receiveCompletion: { print ("Completion: \($0).") },
                receiveValue: { print("Received Timestamp \($0).") }
             )
    }
}

