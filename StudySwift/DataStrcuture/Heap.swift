//
//  Heap.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

struct Heap<T: Comparable> {
    var elements: [T]
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool, elements: [T] = []) {
        self.sort = sort
        self.elements = elements
        
        if elements.isEmpty == false {
            // 힙을 정렬한다.
            // 가장 마지막 부모노드부터 root 노트까지
            // 왜 부모노드부터 시작하는가? 자식 노드는 siftDown 작업을 할 필요가 없다.
            // siftDown 메서드에서 자식노드를 다 검사하기 때문이다. 
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> T? {
        elements.first
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        elements.swapAt(0, elements.count - 1) // 힙의 루트노드 (0)에 마지막 노드가 배치된다.
        let root = elements.removeLast() // 원래 루트노드였던 값을 제거한다.
        siftDown(from: 0) // 원래 힙의 특성대로 다시 배치한다.
        return root
    }
    
    // 아래에서 위로 탐색하면서, 힙을 정렬
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: index)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    // 위에서 아래로 탐색하면서, 힙을 정렬
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = leftChildIndex(of: parentIndex)
            let rightChildIndex = rightChildIndex(of: parentIndex)
            var candidate = parentIndex
            
            if leftChildIndex < count && sort(elements[leftChildIndex], elements[candidate]) {
                candidate = leftChildIndex
            }
            
            if rightChildIndex < count && sort(elements[rightChildIndex], elements[candidate]) {
                candidate = rightChildIndex
            }
            
            // candidate가 parent와 같으면, 부모 노드가 자식 노드보다 크거나/작은 상태가 되었으므로 종료한다.
            if candidate == parentIndex {
                return
            }
            
            elements.swapAt(parentIndex, candidate)
            
            // 이제 parent는 교환된 자식 노드로 이동하고, 다음 자식노드와 다시 비교 시작
            parentIndex = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        2 * index + 2
    }
    
    static func heapSort<T: Comparable>(_ array: [T]) -> [T] {
        var heap = Heap<T>(sort: >, elements: array)
        var sortedArray = [T]()
        
        while heap.isEmpty == false {
            if let maxElement = heap.remove() {
                sortedArray.append(maxElement)
            }
        }
        
        return sortedArray.reversed()
    }
    
    static func test() {
        let numbers = [3, 19, 1, 14, 8, 7]
        let sortedNumbers = heapSort(numbers)
        print(sortedNumbers)  // [1, 3, 7, 8, 14, 19]
    }
}
