//
//  Two-Step Initialization.swift
//  StudySwift
//
//  Created by nylah.j on 11/10/23.
//

import Foundation

final class TwoStepInitialization {
    
    class func safetyCheck1() {
        
    }
}

/// designated initializer는 super class의 initializer를 호출한 후에 super class의 프로티에 값을 설정할 수 있다.
fileprivate class Shape {
    var width: Int = 0
    var height: Int = 0
}

fileprivate class ThreeDimensionShape: Shape {
    var depth: Int
    
    init(depth: Int) {
        self.depth = depth
        super.init()
        width = 2
    }
    
//    init() {
}

