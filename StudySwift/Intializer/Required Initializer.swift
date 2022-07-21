//
//  Required Initializer.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/29.
//

import Foundation

class RequiredSomeClass {
    required init() {
        print("required init in SomeClass")
    }
    
    init(value: String) {
        print(value)
    }
}

class SomeSubClass: RequiredSomeClass {
    var subValue: String
    required init() {
        self.subValue = "subValue"
        super.init()
    }
}
