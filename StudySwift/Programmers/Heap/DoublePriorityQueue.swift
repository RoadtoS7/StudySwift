//
//  DoublePriorityQueue.swift
//  StudySwift
//
//  Created by nylah.j on 9/15/24.
//

import Foundation

final class DoublePriorityQueue {
    func solution(_ operations:[String]) -> [Int] {
        
        var elements: [Int] = []
        
        operations.compactMap {
            Operation(rawValue: $0)
        }.forEach { (op: Operation) in
            switch op {
            case .enqueue(let number):
                elements.append(number)
            case .removeMax:
                var (maxValue, maxIndex) = (-1, -1)
                for (element, index) in elements.enumerated() {
                    maxValue = max(element, maxValue)
                    if maxValue == element {
                        maxIndex = index
                    }
                }
                elements.removeAll { $0 == maxValue }
                
            case .removeMin:
                var (minValue, minIndex) = (Int.min, -1)
                for (element, index) in elements.enumerated() {
                    minValue = min(element, minValue)
                    if minValue == element {
                        minIndex = index
                    }
                }
                
                elements.removeAll { $0 == minValue }
            }
        }
        
        
        
        
        
        return [elements.max() ?? .zero, elements.min() ?? .zero]
    }
    
    func solution2(_ operations:[String]) -> [Int] {
        var queue = Queue()
        
        operations.compactMap {
            Operation(rawValue: $0)
        }.forEach { op in
            switch op {
            case .enqueue(let number):
                queue.enqueue(number)
            case .removeMax:
                queue.removeMax()
            case .removeMin:
                queue.removeMin()
            }
        }
        
        return [queue.max(), queue.min()]
    }
    
    
    
    static func test() {
        [
            ["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"],
        ["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]
        ]
            .forEach {
                let result = DoublePriorityQueue().solution2($0)
                print(result)
            }
    }
    
    
    enum Operation {
        case enqueue(number: Int)
        case removeMax
        case removeMin
        
        init?(rawValue: String) {
            let splitted = rawValue.split(separator: " ")
            guard splitted.count == 2 else {
                return nil
            }

            let (firstCommand, secondCommand) = (splitted[0], splitted[1])
            switch firstCommand {
            case "I":
                self = .enqueue(number: Int(secondCommand)!)
            case "D" where secondCommand == "1":
                self = .removeMax
            case "D" where secondCommand == "-1":
                self = .removeMin
            default:
                return nil
            }
        }
    }
    
    struct Queue {
        var elements: [Int] = []
        
        func max() -> Int {
            elements.max() ?? .zero
        }
        
        func min() -> Int {
            elements.min() ?? .zero
        }
        
        mutating func enqueue(_ element: Int) {
            elements.append(element)
        }
        
        mutating func removeMax() {
            guard let maxValue = elements.max() else {
                return
            }
            
            let index = elements.firstIndex { $0 == maxValue }!
            elements.remove(at: index)
        }
        
        mutating func removeMin() {
            guard let minValue = elements.min() else {
                return
            }
            
            let index = elements.firstIndex { $0 == minValue}!
            elements.remove(at: index)
        }
        
    }
}

