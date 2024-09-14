//
//  Rightparentheses.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//
// 올바른 괄호

import Foundation


final class Parenthese {
    func solution(_ s:String) -> Bool {
        guard s.count > 1 else {
            return false
        }
        
        guard s.first == "(" else {
            return false
        }
        
        var stack: [Character] = []
        for char in s {
            if char == "(" {
                stack.append(char)
            }
            if char == ")" {
                stack.popLast()
            }
        }
        
        let ans:Bool = stack.isEmpty
        return ans
    }
    
    static func test() {
        let paren = Parenthese()
        [
            "()()"    ,
            "(())()"    ,
            ")()("    ,
            "(()("    ,
        ].forEach { string in
            print(paren.solution2(string))
        }
    }
    
    func solution2(_ s: String) -> Bool {
        var openCount: Int = 0, closeCount: Int = 0
        
        for char in s {
            switch char {
            case "(":
                openCount += 1
            case ")":
                closeCount += 1
            default:
                break
            }
            
            guard openCount > closeCount else {
                break
            }
        }
        
        return openCount == closeCount
    }
}
