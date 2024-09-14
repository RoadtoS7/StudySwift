////
////  SortInSwift.swift
////  StudySwift
////
////  Created by nylah.j on 9/14/24.
////
//
//import Foundation
//
//// 가변 컬렉션에 대해서 sort를 할 수 있다.
//// array 요소들이 `Comparable` 프로토콜을 따라야 한다.
//extension MutableCollection where Self: RandomAccessCollection, Element: Comparable {
//    
//    // 결과값 반환 X
//    @inlinable
//    public mutating func sort() {
//        // default는 오름차순
//        sort(by: <)
//    }
//}
//
//// 정렬 기준을 커스텀할 수 있다.
//extension MutableCollection where Self: RandomAccessCollection {
//
//    // `areInIncresingOrder` 라는 클로저를 이용해서 컬렉션을 정렬
//    @inlinable
//    public mutating func sort(
//        by areInIncreasingOrder: (Element, Element) throws -> Bool
//    ) rethrows {
//        // 안전 버퍼 `UnsafeBufferPointer`를 이용해서 정렬함. 이 정렬이 실패하면 fallback 전략으로 sorted(by:)를 사용한 결과값을 반환한다.
//        let didSortUnsafeBuffer: Void? =
//            try withContiguousMutableStorageIfAvailable { buffer in
//                // 버퍼 내에서 안정적인 정렬 알고리즘을 실행함.
//                try buffer._stableSortImpl(by: areInIncreasingOrder)
//            }
//        
//        // 안전 버퍼를 사용하지 못할 경우 fallback 실행.
//        if didSortUnsafeBuffer == nil {
//            // 외부 배열에서 정렬한 다음, 요소들을 다시 컬렉션으로 복사.
//            let sortedElements = try sorted(by: areInIncreasingOrder)
//            
//            // 원래 배열의 인덱스와 정렬된 배열의 인덱스를 하나씩 대응시켜 값들을 대입.
//            for (i, j) in zip(indices, sortedElements.indices) {
//                self[i] = sortedElements[j]
//            }
//        }
//    }
//}
//
