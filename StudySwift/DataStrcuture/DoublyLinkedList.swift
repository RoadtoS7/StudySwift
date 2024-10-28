//
//  DoublyLinkedList.swift
//  StudySwift
//
//  Created by 김수현 on 10/29/24.
// 양방향 Linked List

import Foundation

class DoubleLinkedList<T: Comparable> {
    class Node<T> {
        let value: T
        var next: Node<T>? = nil
        var prev: Node<T>? = nil
        
        init(value: T) {
            self.value = value
        }
    }
    
    var head: Node<T>?
    
    func append(value: T) {
        if head == nil {
            head = Node(value: value)
        } else {
            var current = head
            
            while current?.next != nil {
                current = current?.next
            }
            let node = Node(value: value)
            current?.next = node
            node.prev = current
        }
    }
    
    func delete(value: T) {
        var current: Node<T>? = head
        
        while current != nil {
            if current?.value == value {
                if current?.prev == nil {
                    head = current?.next
                    head?.prev = nil
                } else {
                    current?.prev?.next = current?.next
                    current?.next?.prev = current?.prev
                }
                return
            } else {
                current = current?.next
            }
        }
    }
    
    func sort() {
        head = mergeSort(head)
    }
    
    private func mergeSort(_ head: Node<T>?) -> Node<T>? {
        guard let head else { return nil }
        guard head.next != nil else { return head }
        
        let middelNode = findMiddelNode(head)
        let nextOfMiddle = middelNode?.next
        
        middelNode?.next = nil
    
        
        let left = mergeSort(head)
        let right = mergeSort(nextOfMiddle)
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
    
    private func merge(_ left: Node<T>?, _ right: Node<T>?) -> Node<T>?{
        guard let left else { return right }
        guard let right else { return left}
        
        if left.value < right.value {
            left.next = merge(left.next, right)
            left.next?.prev = left
            return left
        } else {
            right.next = merge(left, right.next)
            right.next?.prev = right
            return right
        }
    }
    
    func printList() {
            var current = head
            while current != nil {
                print(current!.value, terminator: " <-> ")
                current = current?.next
            }
            print("nil")
        }
    
    static func test() {
        // DoubleLinkedList를 사용하는 샘플 코드
        let doublyList = DoubleLinkedList<Int>()

        // 노드 추가
        doublyList.append(value: 10)
        doublyList.append(value: 20)
        doublyList.append(value: 30)
        doublyList.append(value: 40)

        print("Initial List:")
        doublyList.printList() // Output: 10 <-> 20 <-> 30 <-> 40 <-> nil

        // 특정 값 삭제
        doublyList.delete(value: 20)
        print("After Deleting 20:")
        doublyList.printList() // Output: 10 <-> 30 <-> 40 <-> nil

        // 또 다른 값 삭제
        doublyList.delete(value: 10)
        print("After Deleting 10:")
        doublyList.printList() // Output: 30 <-> 40 <-> nil

        // 마지막 노드 삭제
        doublyList.delete(value: 40)
        print("After Deleting 40:")
        doublyList.printList() // Output: 30 <-> nil

        // 빈 리스트에서 삭제 시도
        doublyList.delete(value: 30)
        print("After Deleting 30 (empty list):")
        doublyList.printList() // Output: nil

    }
    
    static func sortTest() {
        // DoubleLinkedList를 사용하는 샘플 코드
        let doublyList = DoubleLinkedList<Int>()

        // 노드 추가
        doublyList.append(value: 40)
        doublyList.append(value: 10)
        doublyList.append(value: 30)
        doublyList.append(value: 20);

        print("Initial List:")
        doublyList.printList() // Output: 40 <-> 10 <-> 30 <-> 20 <-> nil

        // 리스트 정렬
        doublyList.sort()
        print("Sorted List:")
        doublyList.printList() // Output: 10 <-> 20 <-> 30 <-> 40 <-> nil
    }
    
}


