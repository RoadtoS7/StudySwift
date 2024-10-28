//
//  ActorTaskRelationShip.swift
//  StudySwift
//
//  Created by 김수현 on 10/29/24.
//

import Foundation

actor ActorTaskRelationShipTest {
    var count: Int = 1
    
    func incrementCount() {
        count += 1
    }
    
    func test() {
        Task {
            print("$$ count: \(count)")
            incrementCount()
        }
        Task {
            print("$$ count2: \(count)")
            incrementCount()
        }
    }
}
