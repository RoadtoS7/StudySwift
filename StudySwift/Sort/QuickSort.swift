//
//  QuickSort.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class QuickSort<T: Comparable> {
    static func sort(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let pivot = array[array.count / 2]
        
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        
        return sort(less) + equal + sort(greater)
    }
    
    static func test() {
        let array = [33, 10, 55, 71, 2, 13]
        print(QuickSort<Int>.sort(array)) // Output: [2, 10, 13, 33, 55, 71]
    }
}
