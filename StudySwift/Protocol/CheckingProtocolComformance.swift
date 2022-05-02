//
//  CheckingProtocolComformance.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/02.
//

import Foundation

/**
 타입이 특정 프로토콜을 따르는지 구현하는 방법
 is
 as
 */

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

/**
 Circle, Country, Animal은 공통요소가 없지만, 모두 클래스이기 때문에 AnyObject array에 저장될 수 있다.
 */
class ProtocolComformTest {
    static func test() {
        let objects: [AnyObject] = [
            Circle(radius: 2.0),
            Country(area: 243_610),
            Animal(legs: 4)
        ]
        
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("Area is \(objectWithArea.area)")
            } else {
                print("Somethine that dosen't have an area")
            }
        }
    }
}
