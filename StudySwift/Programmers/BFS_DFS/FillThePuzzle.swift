//
//  FillThePuzzle.swift
//  StudySwift
//
//  Created by nylah.j on 8/21/24.
//

import Foundation

final class FillThePuzzle {
    func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
        let row = table.count
        let d = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        
        for i in 0..<row {
            for j in 0..<row {
                table[i][j]
            }
        }
        return -1
    }
    
    func boardPath(_ board: [[Int]]) -> [(Int, Int)] {
        var newBoard = board
        var path = [(Int, Int)]()
        let count: Int = board.count
        
        func addPath(_ x: Int, _ y: Int) {
            var queue: [(Int, Int)] = .init()
            var queueIndex: Int = .zero
            
            let moveX = [-1, 0, 1, 0 ]
            let moveY = [0, -1, 0 , 1]
            
            queue.append((x, y))
            newBoard[x][y] = 1
            
            while queueIndex < queue.count {
                let (selectX, selectY): (Int, Int) = queue[queueIndex]
                queueIndex += 1
                
                for i in 0..<moveX.count {
                    if selectX + moveX[i] >= 0,
                       selectX + moveX[i] <= count,
                       selectY + moveY[i] >= 0,
                       selectY + moveY[i] <= count {
                        
                    }
                }
                
            }
                     
        }
        
        return path
    }
}
