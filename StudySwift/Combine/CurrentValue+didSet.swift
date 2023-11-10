//
//  CurrentValue+didSet.swift
//  StudySwift
//
//  Created by nylah.j on 2023/03/28.
//

import Combine
import Foundation

class CurrentValueTestWithDidSet {
    var mySubject: CurrentValueSubject<Int, Never> = .init(.zero) {
        didSet {
            print("didSet has called")
            myVariable = mySubject.value
        }
    }
    var myVariable: Int? = nil
    
    func test() {
        mySubject.send(2)
        print("myVariable: ", myVariable)
    }
}
