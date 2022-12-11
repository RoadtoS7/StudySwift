//
//  StrongReferenceCycle.swift
//  StudySwift
//
//  Created by nylah.j on 2022/12/11.
//

import Foundation


struct StrongReferenceCycle {
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
        
        var host: Person?
        
        deinit {
            print("Room \(number)가 메모리에서 해제됨")
        }
    }
    
    
    func test_강한참조순환문제() {
        var roadtos7: Person? = .init(name: "roadtos7")
        // Person 인스턴스의 참조 횟수: 1
        var room: Room? = .init(number: "505")
        // Room 인스턴스의 참조 횟수: 1
        
        room?.host = roadtos7
        // Person 인스턴스의 참조 횟수: 2
        roadtos7?.room = room
        // Room 인스턴스의 참조 횟수: 2
        
        roadtos7 = nil
        // Person 인스턴스의 참조 횟수: 1
        room = nil
        // Room 인스턴스의 참조 횟수: 1
        
        // Person인스턴스, Room 인스턴스 둘다 메모리 해제 안됨
        // 이유: 서로가 서로를 참조중임
        // 참조할 방법 없음 -> 해제할 방법 없음
    }
    
    /// 강한 참조 순환문제를 수동으로 해결할 수 있지만.. 개발자가 실수하기 쉽다.
    static func test_강한참조순환문제를_수동으로_해결() {
        var roadtos7: Person? = .init(name: "roadtos7")
        // Person 인스턴스의 참조 횟수: 1
        var room: Room? = .init(number: "505")
        // Room 인스턴스의 참조 횟수: 1
        
        room?.host = roadtos7 // Person 인스턴스의 참조 횟수: 2
        
        roadtos7?.room = room // Room 인스턴스의 참조 횟수: 2
        
        roadtos7?.room = nil // Room 인스턴스의 참조 횟수: 1
        roadtos7 = nil // Person 인스턴스의 참조 횟수: 1
        
        room?.host = nil // Person 인스턴스의 참조 횟수: 0
        room = nil // Room 인스턴스의 참조 횟수: 0
        
        // Room 505 메모리에서 해제됨
    }
}
