//
//  SwiftToLatest.swift
//  StudySwift
//
//  Created by nylah.j on 2022/04/23.
//

import Foundation
import Combine
import SwiftUI

/**
 protocol에서 일반 String으로 생성하고,
 이를 구현한 구현체에서 @Published를 붙일 경우 sink했을 때 받을 수 있는지 궁금함
 => 할 수 없다.
 */

protocol PublisherProtocol {
    var value: String? { get }
}

class PublisherClass: PublisherProtocol {
    @Published var value: String?
}

class PublishedTest {
    static func testError() {
        let publisher: PublisherProtocol = PublisherClass()
        
// error: Value of type 'PublisherProtocol' has no member '$value'
//        publisher.$value.sink() {
//            print("can subscribe \($0)")
//        }
    }
    
    static func test() {
        let viewModel = MyViewModel(name: "Swift Sun0")
        let application = PublishedApplication(viewModel: viewModel)
        application.run()
    }
}

// MARK: 해결 방법 1. Published<String>.Publisher를 사용한다.
protocol ViewModelProtocol {
    var namePublisher: Published<String>.Publisher { get }
    func name(_ value: String)
}

class MyViewModel: ViewModelProtocol {
    @Published var name: String
    
    // viewModel 구현체에서 name publisher를 수동으로 노출한다
    var namePublisher: Published<String>.Publisher { $name }
    
    init(name: String) {
        self.name = name
    }
    
    func name(_ value: String) {
        self.name = value
    }
}

class PublishedApplication {
    var viewModel: ViewModelProtocol
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        self.viewModel.namePublisher
            .receive(on: RunLoop.main)
            .sink { name in
                print("Hello \(name)")
            }.store(in: &cancellables)
    }
    
    func run() {
        viewModel.name( "Swift Sun1")
        viewModel.name( "Swift Sun2")
    }
}

// MARK: 해결 방법 2. associatedtype Publisher 사용
// 단점 dependency injection을 꼭 ViewController단에서 해주어야 한다.
// ViewController


protocol ViewModelWithAssociate {
    associatedtype StringPublisher: Publisher where StringPublisher.Output == String
    associatedtype VoidPublisher: Publisher where VoidPublisher.Output == Void

    var name: StringPublisher { get }
    var presentAlert: VoidPublisher { get }

    
}

struct ViewModelWithAssociateClass : ViewModelWithAssociate {
    var name = CurrentValueSubject<String, Never>("string")
    var presentAlert = PassthroughSubject<Void, Never>()
}


class PublisherAssociatedApplication {
    var viewModel: some ViewModelWithAssociate = ViewModelWithAssociateClass()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        
        viewModel.name
            .sink { _ in } receiveValue: { value in
                print("viewModel.name: \(value)")
            }.store(in: &cancellables)
        
        viewModel.presentAlert.sink { _ in
        } receiveValue: { _ in }

    }
    
}


protocol Container {
    associatedtype Item
    
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}


