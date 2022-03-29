//
//  KeyPathExpression.swift
//  StudySwift
//
//  Created by nylah.j on 2022/02/15.
//

import Foundation

struct SomeStructure {
    var someValue: Int
}

let s = SomeStructure(someValue: 12)
let pathToStucture = \SomeStructure.someValue
let value = s[keyPath: pathToStucture]

// 어떤 타입을 참조하는지 추론할 수 있으면, type name은 표시 하지 않아도 된다.
class SomeClass: NSObject {
    @objc dynamic var someProperty: Int
    init(someProperty: Int) {
            self.someProperty = someProperty
    }
}

let c = SomeClass(someProperty: 10)
//c.observe(\.someProperty) { object,change in
//
//}

struct OuterStruct {
    var outer: SomeStructure
    init(someValue: Int) {
        self.outer = SomeStructure(someValue: someValue)
    }
}

let nested = OuterStruct(someValue: 24)
let nestedKeyPath = \OuterStruct.outer.someValue
let nestedValue = nested[keyPath: nestedKeyPath]

// path는 subscript도 가능하다
let greetings = ["hello", "hola", "bonjour", "안녕"]
let myGreeting = greetings[keyPath: \[String].[1]]

