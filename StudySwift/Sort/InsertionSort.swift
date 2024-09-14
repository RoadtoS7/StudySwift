//
//  InsertionSort.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class InsertionSort {
    static func sort<T: Comparable>(_ array: inout [T]) {
        for i in (1..<array.count) {
            var j = i
            let currentValue = array[i]
            
            // 오름차순이면 array[j-1] < currentValue 되어야 한다.
            // while문에서는 순서가 바뀌니 반대가 되어야 한다.
            // 내림차순이면 array[j-1] > currentvalue
            
            while j > 0 && array[j-1] > currentValue {
                array[j] = array[j-1] // 순서를 바꾼다.
                j -= 1
            }
            
            array[j] =  currentValue
        }
    }
    
    
    static func test() {
        var numbers = [4, 3, 2, 1]
        InsertionSort.sort(&numbers)
        print("$$ numbers: ", numbers)
    }
}
