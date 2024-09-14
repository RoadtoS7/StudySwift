//
//  BubbleSort.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class BubbleSort {
    static func sort<T: Comparable>(_ array: inout [T]){
        let count = array.count
        for i in 0..<count {
            for j in 0..<count - 1-i {
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                }
            }
        }
    }
    
    static func test() {
        var array2 = [33, 10, 55, 71, 2, 13]
        sort(&array2)
        print(array2)
    }
}
