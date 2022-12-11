//
//  Person.swift
//  StudySwift
//
//  Created by nylah.j on 2022/12/11.
//

import Foundation

class ARCPerson {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) 초기화")
    }
    
    deinit {
        print("\(name) 해제")
    }
}

class class_referncecount개념과_강한참조개념 {
    /// 변수, 프로퍼티, 상수에 인스턴스를 할당할 때 default로 강한참조 발생
    static func test1() {
        var reference1: ARCPerson?
        var reference2: ARCPerson?
        var reference3: ARCPerson?
        
        reference1 = ARCPerson(name: "roadtos7")
        // roadtos7 초기화
        // 인스턴스 참조 횟수: 1
        reference2 = reference1
        // 인스턴스 참조 횟수: 2
        reference3 = reference2
        // 인스턴스 참조 횟수: 3
        
        reference1 = nil
        reference2 = nil
        reference3 = nil
        // roadtos7 해제
    }

    /// 참조카운트가 0이 될 때 메모리에서 해제된다.
    static func foo_지역변수_상수의_참조횟수_확인() {
        let person: ARCPerson = .init(name: "roadtos7")
        // roadtos7 초기화
        // 인스턴스 참조 횟수: 1
        
        // 함수 종료 시점
        // 인스턴스 참조 횟수: 0
        // roadtos7 해제
    }
    
    static var globalPerson: ARCPerson?
    
    /// 참조카운트가 0이 아니면, 메모리에서 해제되지 않는다.
    static func code_지역변수_상수의_참조횟수_확인과_전역변수() {
        let roadtoS7: ARCPerson = .init(name: "roadtos7")
        // roadtos7 초기화
        // 인스턴스 참조 횟수: 1
        
        globalPerson = roadtoS7
        // 인스턴스 참조 횟수: 2
        
        // 함수 종료 시점
        // 인스턴스 참조 횟수: 1
    }
}


