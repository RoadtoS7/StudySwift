//
//  Dictionary.swift
//  StudySwift
//
//  Created by nylah.j on 8/15/24.
//

import Foundation

final class DictionaryTest {
    let wordCount: Int = 5
    let alphabet: [String] = ["A", "E", "I", "O", "U"]

    func solution(_ word:String) -> Int {
        var group: String = ""
        var count: Int = 0
        var result: Int = 0
        
        func get() {
             for i in 0..<5 {
                group += alphabet[i]
                count += 1
//                 print(group)
                 if group == word {
                     result = count
                     return
                 } else if group.count < 5 {
                     get()
                     if group == word {
                         return
                     }
                     group.removeLast()
                 } else {
                     group.removeLast()
                 }
            }
        }
       
        get()
        return result
    }
    
    func solution2(_ word: String) -> Int {
        var allKinds: [String] = []
        func dfs(_ cur: String) {
            allKinds.append(cur)
            
            if cur.count == 5 { return }
            
            for i in 0..<5 {
                dfs(cur + alphabet[i])
            }
        }
        
        dfs("")
        return allKinds.firstIndex(of: word)!
        
    }
}
