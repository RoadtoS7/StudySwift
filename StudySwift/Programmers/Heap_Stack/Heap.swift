//
//  Heap.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

struct Queue<Element> {
    private var elements: [Element] = []
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    init(_ elements: Element...) {
        self.elements = elements
    }
    
    init(_ elements:[Element]) {
        self.elements = elements
    }
    
    
    func peek() -> Element? {
        return elements.first
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    mutating func dequeue() -> Element? {
        guard elements.isEmpty == false else {
            return nil
        }
        
        let first = elements.removeFirst()
        return first
    }
    
    static func test() {
        var heap = Queue<Int>(1, 2, 3, 4, 5)
        let peek: Int? = heap.peek()
        print("$$ peak: \(peek)")
        
        heap.enqueue(6)
        let dequeue = heap.dequeue()
        print("$$ dequeue: ", dequeue)
    }
    
    static func test2() {
        var queue = Queue<Int>()
        queue.enqueue(10)
        queue.enqueue(20)
        queue.enqueue(30)

        print(queue.dequeue())  // 10 (첫 번째로 들어온 값)
        print(queue.dequeue())  // 20
        print(queue.peek())     // 30 (첫 번째로 들어온 값 확인, 제거하지 않음)
        print(queue.dequeue())  // 30
    }
}
