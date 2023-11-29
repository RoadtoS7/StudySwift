//
//  TestWeak.swift
//  StudySwift
//
//  Created by nylah.j on 11/29/23.
//

import Foundation

struct TestWeak {
    class Person {
        let name: String
        init(name: String) { self.name = name }
        var apartment: Apartment?
        deinit { print("\(name) is being deinitialized") }
    }
    
    class Apartment {
        let unit: String
        init(unit: String) { self.unit = unit }
        weak var tenant: Person?
        deinit { print("Apartment \(unit) is being deinitialized") }
    }

    static var john: Person?
    static var unit4A: Apartment?
    
    func test_reverse_nil() {
        print("$$ apple 에제와 nil 설정 코드를 반대로 하더라도 제대로 동작하는가?")
        var john: Person?
        var unit4A: Apartment?


        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")


        john!.apartment = unit4A
        unit4A!.tenant = john
        
        unit4A = nil
        // Prints "Apartment 4A is being deinitialized"
        
//        john = nil
        // Prints "John Appleseed is being deinitialized"
    }
    
    static func test_reverse_nil_2() {
        print("$$ apple 에제에서와 달리 class에서 weak설정을 반대로 하더라도 제대로 동작하는가?")

        john = Person(name: "John Appleseed") // Person : 1
        unit4A = Apartment(unit: "4A") // Apartment : 1


        john!.apartment = unit4A // Apartment: 1
        unit4A!.tenant = john // Person 참조카운트: 2
        
        
        john = nil // Person의 참조카운트 1 (from Apartment.tenant)
        // Apartment의 참조카운트 = 1
        
        // Prints "John Appleseed is being deinitialized"
        
        unit4A = nil // Apartment 참조 카운트 = 0 (프로퍼티들 먼저 nil된다.)
        // Prints "Apartment 4A is being deinitialized"
    }
}
