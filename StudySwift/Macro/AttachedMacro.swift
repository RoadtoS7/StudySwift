//
//  AttachedMacro.swift
//  StudySwift
//
//  Created by nylah.j on 2023/10/05.
//

import Foundation

// method 추가 or protocol 준수하도록 수정

// 각 option에서 생성자 호출하는 부분이 반복된다.
//struct SundaeToppings: OptionSet {
//    let rawValue: Int
//    static let nuts = SundaeToppings(rawValue: 1 << 0)
//    static let cherry = SundaeToppings(rawValue: 1 << 1)
//    static let fudge = SundaeToppings(rawValue: 1 << 2)
//}


/**
 @OptionSet
 OptionSet 프로토콜을 준수하도록 만든다.
 privte enum을 읽어서 각각을 option set의 멤버로 만듬
 */
struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }
}

// MARK: - 결과
//struct SundaeToppings {
//    private enum Options: Int {
//        case nuts
//        case cherry
//        case fudge
//    }
//
//
//    typealias RawValue = Int
//    var rawValue: RawValue
//    init() { self.rawValue = 0 }
//    init(rawValue: RawValue) { self.rawValue = rawValue }
//    static let nuts: Self = Self(rawValue: 1 << Options.nuts.rawValue)
//    static let cherry: Self = Self(rawValue: 1 << Options.cherry.rawValue)
//    static let fudge: Self = Self(rawValue: 1 << Options.fudge.rawValue)
//}
//extension SundaeToppings: OptionSet { }


// 매크로는 샌드박스 환경에서 별도의 프로세스에서 실행된다.
