//
//  Assigning Constant Properties During Initialization.swift
//  StudySwift
//
//  Created by nylah.j on 2022/04/12.
//

import Foundation

class ConstantPropertyDuringInitialization {
    let constant: Int
    
    /**
     constant가 상수일지라도 선언과 값의 할당을 분리해서 할 수 있다.
     */
    init(constant: Int) {
        self.constant = constant
    }
}
