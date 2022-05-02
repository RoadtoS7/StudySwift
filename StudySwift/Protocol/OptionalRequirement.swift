//
//  OptionalRequirement.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/02.
//

import Foundation

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

/**
 1. dataSource가 nil일 수 있기 때문에 ?붙인다.
 2. increment() 메서드가 구현안되어있을 수 있기 때문에(optional 타입이기 때문에) ? 붙인다.
 -> 첫번째 optional binding에서 nil이 반환될 경우: dataSource가 nil 아니면, incremenet()가 구현되어있지 않은 경우
 
 1. dataSource가 nil일 수 있기 때문에 ?붙인다.
 2. fixedIncremenet가 구현안되어 있을 수 있기 때문에(optional 타입이기 때문에) ? 붙인다.
 -> 두번째 optional binding에서 nil이 반환될 경우: dataSource가 nil 아니면, fixedIncrement가 구현되어있지 않은 경우
 */
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

// NSObject: Object-c 의 루트 클래스, NSObject를 상속받은 인스턴스는 Object-v의 인스턴스처럼 동작할 수 있다.
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement: Int = 3
    
    static func test() {
        var counter = Counter()
        
        counter.dataSource = ThreeSource()
        for _ in 1...4 {
            counter.increment()
            print(counter.count)
        }
    }
}

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        }
        
        if count < 0 {
            return 1
        }
        
        return -1
    }
    
    static func test() {
        let counter = Counter()
        counter.count = -4
        counter.dataSource = TowardsZeroSource()
        
        for _ in 1...5 {
            counter.increment()
            print(counter.count)
        }
    }
}
