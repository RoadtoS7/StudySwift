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

class SerialPublisherTest {
    func test() {
        let cancellable =  performSequentialTasks()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("모든 작업이 성공적으로 완료되었습니다.")
                case .failure(let error):
                    print("작업 중 오류 발생: \(error.localizedDescription)")
                }
                
            }, receiveValue: {
                print("데이터가 성공적으로 저장되었습니다.")
                
            })
    }
    
    func performSequentialTasks() -> AnyPublisher<Void, Error> {
        fetchData().flatMap { data -> AnyPublisher<String, Error> in
            if data == "특정 조건" {
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            } else {
                return self.processData(data).eraseToAnyPublisher()
            }
        }.flatMap({ processedData -> AnyPublisher<Void, Error> in
            if processedData == "다른 조건" {
                return Fail(error: NSError(domain: "Custom Error", code: -1, userInfo: nil)).eraseToAnyPublisher()
            } else {
                return self.saveData(processedData).eraseToAnyPublisher()
            }
        })
        .eraseToAnyPublisher()
            
    }
    
    /// 네트워크 요청을 시뮬레이션하는 비동기 작업
    func fetchData() -> AnyPublisher<String, Error> {
        Future<String, Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: .init(block: {
                let success = Bool.random()
                if success {
                    promise(.success("데이터 수신 성공"))
                } else {
                    promise(.failure(NSError(domain: "NetworkError", code: -1, userInfo: nil)))
                }
            }))
        }.eraseToAnyPublisher()
    }
    
    func processData(_ data: String) -> AnyPublisher<String, Error> {
        Future<String, Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: .init(block: {
                if data.contains("성공") {
                    promise(.success("데이터 처리 완료"))
                } else {
                    promise(.failure(NSError(domain: "ProcessingError", code: -1, userInfo: nil)))
                }
            }))
        }.eraseToAnyPublisher()
    }
    
    func saveData(_ data: String) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: .init(block: {
                let success = Bool.random()
                if success {
                    promise(.success(()))
                } else {
                    promise(.failure(NSError(domain: "SaveError", code: -1, userInfo: nil)))
                }
            }))
        }.eraseToAnyPublisher()
    }
    
}
