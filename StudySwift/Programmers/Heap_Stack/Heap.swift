//
//  Heap.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

struct Heap<Element> {
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
        var heap = Heap<Int>(1, 2, 3, 4, 5)
        let peek: Int? = heap.peek()
        print("$$ peak: \(peek)")
        
        heap.enqueue(6)
        let dequeue = heap.dequeue()
        print("$$ dequeue: ", dequeue)
    }
}
