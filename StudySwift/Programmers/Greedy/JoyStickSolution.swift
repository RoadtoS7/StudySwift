//
//  JoyStickSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/16/24.
//

import Foundation

final class JoyStickSolution {
    func moveLeft(_ finished: [Bool], index: Int) -> Int {
        if finished.contains(false) == false {
            return 0
        }
        
        var newFinished = finished
        let newIndex = (index - 1 + finished.count) % finished.count
        if newFinished[newIndex] == true {
            return 1 + moveLeft(newFinished, index: newIndex)
        }
        
        newFinished[newIndex] = true
        return 1 + min( moveLeft(newFinished, index: newIndex), moveRight(newFinished, index: newIndex))
    }
    
    func moveRight(_ finished: [Bool], index: Int) -> Int {
        if finished.contains(false) == false {
            return 0
        }
        var newFinished = finished
        let newIndex = (index + 1 + finished.count) % finished.count
        if newFinished[newIndex] == true {
            return 1 + moveRight(newFinished, index: newIndex)
        }
        
        newFinished[newIndex] = true
        return 1 + min(moveLeft(newFinished, index: newIndex), moveRight(newFinished, index: newIndex))
    }
    func solution(_ name:String) -> Int {
        var finishSetting: [Bool] = name.map { $0 == "A" }
        finishSetting[0] = true
        var totalMove = min(moveLeft(finishSetting, index: 0), moveRight(finishSetting, index: 0))

        for char in name {
            var move = Int(char.asciiValue!) - Int(Character("A").asciiValue!)
            move = min(move, 26 - move)
            totalMove += move
        }
        return totalMove
    }
    
    static func test() {
        [
            "JEROEN",
            "JAN",
        ].forEach {
            print(JoyStickSolution().solution($0))
        }
        
    }
}
