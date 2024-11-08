//
//  CircularLinkedList.swift
//  StudySwift
//
//  Created by 김수현 on 10/29/24.
//

import Foundation

class CircularLinkedList<T: Comparable> {
    class Node<T> {
        let value: T
        var next: Node<T>? = nil
        
        init(value: T) {
            self.value = value
        }
    }
    
    var head: Node<T>?
    
    func append(value: T) {
        if head == nil {
            head = Node(value: value)
            head?.next = head
        } else {
            var current: Node<T>? = head
            while current?.next != nil {
                current = current?.next
            }
            
            let node = Node(value: value)
            current?.next = node
            node.next = head
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
        var current = head
        var prev: Node<T>? = nil
        
        repeat {
            if current?.value == value {
                if current === head { // 현재가 Head 일 때
                    if head?.next === head {
                        head = nil // head혼자이면 head를 없앰
                    } else {
                        head = head?.next
                        let tail = getTail()
                        tail?.next = head
                    }
                } else { // 중간 node 혹은 끝 노드일 때
                    prev?.next = current?.next
                }
                return
            } else {
                prev = current
                current = current?.next
            }
        } while current !== head
    }
    
    private func getTail() -> Node<T>? {
        guard let head else { return nil}
        var current = head
        
        while current.next !== head {
            current = current.next!
        }
        return current
    }
}
