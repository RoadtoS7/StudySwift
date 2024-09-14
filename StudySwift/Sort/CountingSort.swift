//
//  CountingSort.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class CountingSort {
    static func sort(_ array: [Int]) -> [Int] {
        guard let minElement = array.min(), let maxElement = array.max() else {
            return array
        }
        
        var count = [Int](repeating: 0, count: maxElement - minElement + 1)
        
        for num in array {
            count[maxElement - num] += 1
        }
        
        print("$$ count: ", count)
        var sortedArray = [Int]()
        for (index, value) in count.enumerated() {
            let arr = Array<Int>(repeating: index + minElement, count: value)
            print(arr)
            sortedArray += Array<Int>(repeating: index + minElement, count: value)
        }
        
        return sortedArray
    }
    
    static func test() {
        let array4 = [33, 10, 55, 71, 2, 13]
        print(sort(array4)) // Output: [2, 10, 13, 33, 55, 71]
    }
}
