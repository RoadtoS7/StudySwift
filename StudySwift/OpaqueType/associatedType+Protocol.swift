////
////  associatedType+Protocol.swift
////  StudySwift
////
////  Created by nylah.j on 2023/03/13.
////
//
//import Foundation
//
//struct TestItem: Item{
//    let key: String
//}
//
/////////////////
//
//protocol Item {
//    var key: String { get }
//}
//protocol Delegate: AnyObject {
//    func didSelect(_ items: Array<Item>)
//}
//
//final class ModalView {
//    weak var delegate: Delegate?
//}
//
//final class DelegateComfortance: Delegate {
//    private var items: Array<Item> = []
//    
//    func didSelect(_ items: Array<any Item>) {
//        self.items = items
//    }
//}
//
//// MARK: - asscoaitedType 또는 Self를 갖지 않는 것은 protocol을 타입으로 사용할 수 있다.
//public protocol Image {
//    var title: String { get }
//}
//
//public protocol ImageFetching {
//    func fetchImage() -> Image
//}
//
//// MARK: - asscoiatedType/Self를 타입으로 사용하기 위한 기법1: type eraser
//protocol ItemContainer {
//    associatedtype T
//    var items: [T] { get }
//    mutating func append(_ item: T)
//    var count: Int { get }
//    subscript(_ i: Int) -> T { get }
//}
//
//// protocol의 구체 타입
//struct IntConatiner: ItemContainer {
//    var items: [Int] = []
//    mutating func append(_ item: Int) {
//        items.append(item)
//    }
//    var count: Int {
//        items.count
//    }
//    
//    subscript(i: Int) -> Int {
//        items[i]
//    }
//}
//
//class WithOutErser<ItemConatiner: ItemContainer> {
//    let itemContainer: ItemConatiner
//    
//    init(itemContainer: ItemConatiner) {
//        self.itemContainer = itemContainer
//    }
//}
//
//// type erasor - 제네릭 struct/class, 제네릭 타입으로 associated type이 무엇인지 지정한다.
//// initlaizer로 ItemContainer 구현체를 받아서 메서드/프로퍼티 호출을 전달한다.
//struct AnyContainer<Item>: ItemContainer {
//    mutating func append(_ item: Item) {
//        _append(item)
//    }
//    
//    var count: Int {
//        _count()
//    }
//    
//    subscript(i: Int) -> Item {
//        _supscript(i)
//    }
//    
//    private let _append: (Item) -> Void
//    private let _count: () -> Int
//    private let _supscript: (Int) -> Item
//    
//    var items: [Item] {
//        fatalError("Direct access is not allowed")
//    }
//    
//    init<C: ItemContainer>(_ container: C) where C.T == Item {
//        _append = { container.append($0)}
//        _count = { container.count }
//        _supscript = { container[$0] }
//    }
//}
//
//// type eraser 사용 예시
//class TypeEraserTest {
//    static func test() {
//        var intConatiner = IntConatiner()
//        intConatiner.append(1)
//        intConatiner.append(2)
//        
//        // AnyContainer<Int>를 통해서 타입을 지정한다.
//        var container: AnyContainer<Int> = AnyContainer(intConatiner)
//        print(container[0])
//        print(container.count)
//    }
//}
//
//// MARK: - asscoiatedType/Self를 타입으로 사용하기 위한 기법2: generic
//
//// MARK: - asscoiatedType/Self를 타입으로 사용하기 위한 기법3: primary associated type
//
//
//
