//
//  Future.swift
//  StudySwift
//
//  Created by nylah.j on 2022/08/26.
//

import Combine
import Dispatch
import Foundation

func generateAsyncRandomNumberForFuture() -> Future<Int, Never> {
    return Future { promise in
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let number = Int.random(in: 1...10)
            promise(.success(number))
        }
    }
}

func future_동작() {
    var cancellableSet = Set<AnyCancellable>()
    let future = generateAsyncRandomNumberForFuture()
    future
        .receive(on: RunLoop.main)
        .sink { completion in
        switch completion {
        case .failure(_): print("never error occurred??")
        case .finished: print("finished")
        }
    } receiveValue: { value in
        print("receive value: \(value)")
    }.store(in: &cancellableSet)
}
