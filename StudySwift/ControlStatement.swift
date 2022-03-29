//
//  ControlStatement.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/28.
//

import Foundation

/**
 fallthrough는 호출하자마자 현재 case문의 나머지 문장은 실행안하고, 바로 다음 case문이 실행되도록 한다.
 */


class Fallthrough {
    func testFallthrough() {
        enum MonsterType {
            case munngu
            case slime
            case oak
            
            var name: String {
                switch self {
                case .munngu:
                    return "Mungu"
                case .slime:
                    return "Slime"
                case .oak:
                    return "Oak"
                }
            }
        }
        
        let monsterType: MonsterType = .munngu
        
        switch monsterType {
        case .munngu:
            print("이것은 \(monsterType.name)")
            print("원래는 여기까지 출력되지만")
            fallthrough
        case .slime:
            print("fallthrough이면 여기까지도 출력된다.")
            fallthrough
            print("이것은 \(monsterType.name)") // 여기는 출력되지 않는다.
        case .oak:
            print("fallthrough이면 여기까지도 출력된다.")
            // fallthrough 마지막 case에서는 fallthrough대신 break를 사용해야 한다.
            break
            print("이것은 \(monsterType.name)")
        }
    }
}
