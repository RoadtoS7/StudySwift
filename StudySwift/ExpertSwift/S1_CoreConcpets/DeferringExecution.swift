//
//  DeferringExecution.swift
//  StudySwift
//
//  Created by nylah.j on 2022/12/03.
//

import Foundation

func ifelse<V>(_ condition: Bool,
               _ valueTrue: @autoclosure () -> V,
               _ valueFalse: @autoclosure () -> V) -> V {
  condition ? valueTrue() : valueFalse()
}


func expesiveFunc1() -> Int {
    print("side-effect-1")
    return 1
}

func expesiveFunc2() -> Int {
    print("side-effect-2")
    return 42
}

let taxicab = ifelse(.random(),
                     expesiveFunc1(),
                     expesiveFunc2())


