//
//  FlatMap.swift
//  StudySwift
//
//  Created by nylah.j on 2022/04/23.
//

import Foundation
import Combine

/**
 FlatMap은 언제 사용할까?
 1. upstream publisher를 조건에 따라서 다른 publisher로 대체할 때 사용한다.
 2. flatMap에서 발행한 publisher는 저장된다. 따라서 flatMap에서 전달한 publisher에 값을 발행하면 flatMap의 downstream으로 값이 전달된다.
 -> 메모리 문제가 발생할 수 있다.
 */

struct PersonStruct {
    let name: CurrentValueSubject<String, Never>
}

class PublisherTest {
    static func test() {
        let personA = PersonStruct(name: .init("Felix"))
        let personB = PersonStruct(name: .init("Han"))
        let personC = PersonStruct(name: .init("Peter"))
        
        let subject = PassthroughSubject<PersonStruct, Never>()
        _ = subject.flatMap({ $0.name })
        .sink { print($0) }
        
        subject.send(personA)
        subject.send(personB)
        subject.send(personC)
        
        personB.name.send("Suhyeon")
    }
    
    static func testMaxPublisher() {
        let personA = PersonStruct(name: .init("Felix"))
        let personB = PersonStruct(name: .init("Han"))
        let personC = PersonStruct(name: .init("Peter"))
    
        let subject = PassthroughSubject<PersonStruct, Never>()
        
        let cancelelable =  subject.flatMap(maxPublishers: .max(2), { $0.name })
            .sink { print($0) }
        
        subject.send(personA)
        subject.send(personB)
        subject.send(personC)
        
        personC.name.send("Suhyeon") // personC는 flatMap의 buffer에 저장되지 않았기 때문에 print되지 않는다.
    }
}
