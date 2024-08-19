//
//  CompareWord.swift
//  StudySwift
//
//  Created by nylah.j on 8/18/24.
//

import Foundation

func compareWord(_ current: String, _ next: String) -> Bool {
    var diffCharCount = 0
    var currentWord: [Character] = Array(current)
    var nextWord: [Character] = Array(next)

    for index in 0..<current.count {
        if currentWord[index] != nextWord[index] {
            diffCharCount += 1
            if diffCharCount > 1 {
                return false
            }
        }
    }
    return true
}
