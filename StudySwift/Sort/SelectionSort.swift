//
//  SelectionSort.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class SelectionSort {
    static func sort<T: Comparable>(_ array: inout [T]) {
        let count = array.count
        
        for i in 0..<count {
            // 정렬되지 않은 부분의 가장 첫번재 인덱스가 minimum 값을 갖는다고 가정
            var minIndex = i
            
            for j in i+1..<count {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            
            // 가장 작은 값을 찾은 것을, 정렬되지 않은 부분의 첫번째 요소와 swap
            array.swapAt(i, minIndex)
        }
    }
    
    static func test() {
        var array3 = [33, 10, 55, 71, 2, 13]
        sort(&array3)
        print(array3) // Output: [2, 10, 13, 33, 55, 71]
    }
}
