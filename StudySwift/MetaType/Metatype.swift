//
//  Metatype.swift
//  StudySwift
//
//  Created by nylah.j on 2022/12/30.
//

import Foundation


protocol Devicable {}
class MyDevice: Devicable {}

class MetaTypeStudy {
    struct Medium {
        static var author: String = "RoadotS7"
        func postArticle() { print("post article") }
    }
    
    /// dynamic metatType: type(of:) 리턴값
    /// 컴파일 타입에 결정된다.
    /// 하위 타입의 메타타입을 알기 위해선 dyanimc metatype을 사용해야만 한다.
    static func dynamicMetatype() {
        let number: Any = 1
        let numberType = type(of: number)
        print("numberType: \(numberType)") // Int
    }
    
    /// static metaType: .self
    /// 컴파일 타입에 결정
    static func staticMetatype() {
        let staticType: Medium.Type = Medium.self
        print("staticType: \(staticType)") // Medium
    }
    
    /// 프로토콜.Type = 모든 프로토콜 구현체의 메타타입
    /// 프로토콜.Protocol = 프로토콜의 메타타입
    /// 프로토콜의 메타타입을 이용해서 주로 하는 일? 타입 일치여부 체크
    /// 예외: Any = Any는 모든 타입이 comfort하는 타입이다.
    static func protocolMetattype() {
//        let nonProtocolMetatype: Devicable.Type = Devicable.self // 컴파일 에러
        let metatype: Devicable.Type = MyDevice.self
        
        let protocolMetatype: Devicable.Protocol = Devicable.self
        let anyType: Any.Type = Any.self
    }
}

