//
//  ProtocolExtension.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/02.
//

import Foundation

/**
 프로토콜 extension 언제 사용?
 1. 프로토콜의 기능 확장
 2. 프로토콜에 기본 기능 제공
    - 보통 기능 확장을 하게 되면, 기존에 프로토콜을 따르는 구현체에서 수정이 발생해야 한다. 따라서 extension에서 기능을 추가할 때는 기본 구현을 함께 제공하는 듯하다.
 */
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
