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
    
    func solution3(word: String) -> Int {
        let voul = ["A", "E", "I", "O", "U"]
        var temp: String = ""
        var count: Int = 0
        
        for i in 0..<5 { // 0번째 인덱스
            temp.append(voul[i])
            count += 1
            if temp == word {
                return count
            }
            
            for j in 0..<5 { // 1번째 인덱스
                temp.append(voul[j])
                count += 1
                if temp == word {
                    return count
                }
                
                for k in 0..<5 { // 2번째 인덱스
                    temp.append(voul[k])
                    count += 1
                    if temp == word {
                        return count
                    }
                    
                    for l in 0..<5 { // 3번째 인덱스
                        temp.append(voul[l])
                        count += 1
                        if temp == word {
                            return count
                        }
                        
                        for m in 0..<5 { // 3번째 인덱스
                            temp.append(voul[m]) // 4번째 인덱스
                            count += 1
                            if temp == word {
                                return count
                            }
                            temp.removeLast()
                        }
                        temp.removeLast()
                    }
                    temp.removeLast()
                }
                temp.removeLast()
            }
            temp.removeLast()
        }
        return count
    }
    
    static func test() {
        [
            "AAAAE",
            "AAAE",
            "I",
            "EIO"
        ].forEach {
            print(DictionaryTest().solution3(word: $0))
        }
    }
}
