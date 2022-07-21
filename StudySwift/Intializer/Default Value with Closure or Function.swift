//
//  Default Value with Closure or Function.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/29.
//

import Foundation

class ChessBoard {
    let boardColors: [Bool] = {
        var tempBoardColors: [Bool] = []
        var isBlack = false
        
        for i in 1...8{
            for j in 1...8 {
                tempBoardColors.append(isBlack)
                isBlack != isBlack
            }
            isBlack != isBlack
        }
        
        return tempBoardColors
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[row * 8 + column]
    }
}
