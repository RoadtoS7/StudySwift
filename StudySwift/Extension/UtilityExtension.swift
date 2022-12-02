//
//  UtilityExtension.swift
//  StudySwift
//
//  Created by nylah.j on 2022/09/07.
// 실제로 사용하는 것들!! 삭제 하면 안됨

import Foundation

func printAddress<T: Any>(fo object: T) {
    withUnsafePointer(to: object) { pointer in
        print("Address: \(pointer)")
    }
}

