//
//  MergeSort.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class MergeSort {
    static func sort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        let leftArray = sort(Array(array[0..<middleIndex]))
        let rightArray = sort(Array(array[middleIndex..<array.count]))
        return merge(leftArray, rightArray)
    }
    
    static func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray: [T] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] <= right[rightIndex] {
                orderedArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                orderedArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return orderedArray
    }
    
    static func test() {
        let numbers = [4, 3, 2, 1]
        let sortedNumbers = sort(numbers)
        print("$$ sortedNumbers: ", sortedNumbers)
    }
}
