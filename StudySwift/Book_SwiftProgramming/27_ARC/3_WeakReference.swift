
//
//  WeakReference.swift
//  StudySwift
//
//  Created by nylah.j on 2022/12/11.
//

import Foundation

struct WeakReference {
    class Person {
        let name: String
        
        init(name: String) {
            self.name = name
        }
        var room: Room?
        
        deinit {
            print("\(name)이 메모리에서 해제됨")
        }
    }
    
    class Room {
        let number: String
        
        init(number: String) {
            self.number = number
        }
        
        weak var host: Person?
        
        deinit {
            print("Room \(number)가 메모리에서 해제됨")
        }
    }
    
    static func test_강한참조문제를_약한참조로_해결() {
        var roadtoS7: Person? = .init(name: "roadtos7") // Person 인스턴스의 참조 횟수: 1
        var room: Room? = .init(number: "505") // Room 인스턴스의 참조 횟수: 1
        
        roadtoS7?.room = room  // Room 인스턴스의 참조 횟수: 2
        room?.host = roadtoS7  // Person 인스턴스의 참조 횟수: 1
        
        roadtoS7 = nil  // Person 인스턴스의 참조 횟수: 0, Room 인스턴스의 참조 횟수 1
        // 중요! 인스턴스가 해제될 때, 인스턴스의 프로퍼티가 강한참조하던 인스턴스의 참조횟수가 1 감소된다.
        // roadtoS7 메모리에서 해제
        room = nil // Room 인스 턴스의 참조 횟수: 0
        
    }
}
