//
//  ProtocolComposition.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/02.
//

import Foundation

/**
 1. 프로토콜을 합성해서 사용할 수 있다.
 2. 합성? &로 여러 프로토콜을 합치는 것
 3. 합친 프로토콜의 요구 사항을 모두 갖는 프로토콜을 만드는 것과 같지만, 합성결과가 새로운 타입으로 만들어지는 것은 아니다.
 4. 1개의 superclass를 함께 사용할 수 있다.
 5. 합성했을 때 좋은점: 여러 프로토콜을 구현한 특정 구현체가 아니라 추상적인 타입을 받을 수 있다.
 */

protocol Named {
    var name: String { get set }
}

protocol Aged {
    var age: Int { get set }
}

struct NameAgedPerson: Named & Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Birthday, \(celebrator.name), you're \(celebrator.age)")
}

// Location, City 예시

class Location {
    var latitude: Double
    var longtitude: Double
    
    init(latitude: Double, longtitude: Double) {
        self.latitude = latitude
        self.longtitude = longtitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longtitude: Double) {
        self.name = name
        super.init(latitude: latitude, longtitude: longtitude)
    }
}

func beginConcer(in location: Location & Named) {
    print("Hello, \(location.name)")
}

class LocatoinAndCityTest {
    static func test() {
        let seattle = City(name: "Seattle", latitude: 47, longtitude: -122)
        beginConcer(in: seattle)
    }
}


