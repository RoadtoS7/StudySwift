//
//  Metatype.swift
//  StudySwift
//
//  Created by nylah.j on 2022/12/30.
//

import Foundation

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
        print("numberType: \(numberType)")
    }
}
