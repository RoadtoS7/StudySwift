//
//  ARC.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/06.
//

import Foundation

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

/**
 reference count에 따라서 deinitialize 된다.
 */
func referenceCount() {
    var assignment1: Person? // Optional 타입이므로 선언과 동시에 nil 할당
    var assignment2: Person?
    var assignment3: Person?
    
    assignment1 = Person(name: "John Appleseed") // print
    print("assignment1")
    assignment2 = assignment1
    print("assignment2")
    assignment3 = assignment1
    print("assignment3")
    
    assignment1 = nil
    print("deassignment1")
    assignment2 = nil
    print("deassignment2")
    assignment3 = nil // print
    print("deassignment3")
    
}
 
