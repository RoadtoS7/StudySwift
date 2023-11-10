//
//  StringInterPolation.swift
//  StudySwift
//
//  Created by nylah.j on 2023/08/23.
//

/**
 StringInterPolation extension을 사용하는 것 과 CustomStringConvertible 을 사용하는 것이 같다.
 */

import Foundation

struct InterpolationUser {
    let name: String
    let age: Int
}

struct NonInterPolationUser {
    let name: String
    let age: Int
}

struct StringConvertibleUser: CustomStringConvertible {
    let name: String
    let age: Int
    
    var description: String {
        "StringConvertibleUser name is \(name), age is \(age)"
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: InterpolationUser) {
        appendInterpolation("My name is \(value.name) and I'm \(value.age)")
    }
    
    mutating func appendInterpolation(_ number: Int, style: NumberFormatter.Style) {
        let formatter = NumberFormatter()
        formatter.numberStyle = style

        if let result = formatter.string(from: number as NSNumber) {
            appendLiteral(result)
        }
    }
}

struct CustomStringInterpolation {
    func testNonInterpolationUser() {
        let user: NonInterPolationUser = .init(name: "Guybrush", age: 33)
        print("User details: \(user)")
    }
    
    func testBuiltIn() {
        let user: InterpolationUser = .init(name: "Guybrush", age: 33)
        print("User details: \(user)") // 구조체 타입이 print 문에서 어떻게 나타날지 결정
    }
    
    func testCustomStringConvertible() {
        
    }
}
