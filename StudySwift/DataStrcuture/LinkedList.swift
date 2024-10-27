//
//  LinkedList.swift
//  StudySwift
//
//  Created by 김수현 on 10/27/24.
//

import Foundation

class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

final class LinkedList2<T: Equatable> {
    var head: Node<T>?
    
    func append(value: T) {
        if head == nil {
            head = Node(value: value)
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = Node(value: value)
        }
    }
    
    func delete(value: T) {
        var current = head
        var prev: Node<T>? = nil
        
        while current != nil {
            if current?.value == value {
                if prev == nil {
                    head = current?.next
                } else {
                    prev?.next = current?.next
                }
                return
            }
            
            prev = current
            current = current?.next
        }
    }
    
    func printAll() {
        var current = head
        while current != nil {
            print("\(current?.value)")
            current = current?.next
        }
    }
}

final class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    func append(value: T) {
        if head == nil {
            head = Node(value: value)
        } else {
            var current: Node<T>? = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = Node(value: value)
        }
    }
    
    func printAll() {
        var cursor: Node<T>? = head
        while cursor != nil {
            print("\(cursor?.value)")
            cursor = cursor?.next
        }
        print("end!!")
    }
    
    func delete(value: T) {
        var cursor: Node<T>? = head
        var prev: Node<T>? = nil
        
        while cursor != nil {
            if cursor?.value == value {
                if prev == nil {
                    head = cursor?.next
                } else {
                    prev?.next = cursor?.next
                }
                return
            }
            
            prev = cursor
            cursor = cursor?.next
        }
    }
    
    static func test() {
        let list = LinkedList2<Int>()
        list.append(value: 1)
        list.append(value: 2)
        list.append(value: 3)

        print("Initial List:")
        list.printAll()

        list.delete(value: 2)
        print("After Deleting 2:")
        list.printAll()
    }
}
