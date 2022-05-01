//
//  MutatingFunction.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/01.
//

import Foundation
import SwiftUI

/**
 1. mutating으로 선언된 함수도 class에서 구현할 때는 mutating을 붙이지 않아도 된다.
 2. enumeration과 함께 사용하면, self의 값을 switch 내부에서 바꿀 때 사용할 수 있다.
 */

protocol Mutating {
    mutating func plus()
}

class MutatingClass: Mutating {
    var number: Int = 0
    
    func plus() {
        number += 1
    }
}

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}


class TestTogglable {
    static func test() {
        var toggleButton = OnOffSwitch.off
        print("current switch: \(toggleButton)")
        toggleButton.toggle()
        print("after toggle: \(toggleButton)")
    }
}
