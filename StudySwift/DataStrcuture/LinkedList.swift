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

final class LinkedList<T: Comparable> {
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
    
    func sort() {
        head = mergeSort(head)
    }
    
    private func mergeSort(_ head: Node<T>?) -> Node<T>? {
        guard let head else { return nil }
        if head.next == nil { return head }
        
        let middelNode = findMiddelNode(head)
        let nextOfMiddel = middelNode?.next
        middelNode?.next = nil
        let left = mergeSort(head)
        let right = mergeSort(nextOfMiddel)
        
        return merge(left, right)
    }
    
    private func findMiddelNode(_ head: Node<T>?) -> Node<T>? {
        var slow = head
        var fast = head
        
        while fast?.next != nil, fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    private func merge(_ left: Node<T>?, _ right: Node<T>?) -> Node<T>? {
        guard let left else { return right }
        guard let right else { return left }
        
        if left.value < right.value {
            left.next = merge(left.next, right)
            return left
        } else {
            right.next = merge(left, right.next)
            return right
        }
    }
    
    static func sortTest() {
        let list = LinkedList<Int>()
        list.append(value: 3)
        list.append(value: 1)
        list.append(value: 4)
        list.append(value: 2)

        print("Before sorting:")
        list.printAll() // Output: 3 -> 1 -> 4 -> 2 -> nil

        list.sort()
        print("After sorting:")
        list.printAll() // Output: 1 -> 2 -> 3 -> 4 -> nil
    }
}
