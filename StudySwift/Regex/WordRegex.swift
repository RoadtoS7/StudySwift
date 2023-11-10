//
//  WordRegex.swift
//  StudySwift
//
//  Created by nylah.j on 2023/01/11.
//

import Foundation

extension String {
    func match(with regex: NSRegularExpression) -> Bool {
        let fullRange = NSRange(startIndex..<endIndex, in: self)
        let firstResult = regex.firstMatch(in: self, options: [], range: fullRange)
        print(firstResult?.range)
        return firstResult?.range == fullRange
    }
}
// 특정 단어로 시작하는지 체크
struct PrefixRegex {
    let prefix = "top"
    let regex = "^top" // top으로 시작
    
    let words = [
        "top_hot_main",
        "top_hot_normal",
        "top_rank_all",
        "top_rank_fantasy_drama",
        "top_rank_romance",
    ]
    
//    // ^ = 시작에 위치하는 대상 지목
//    print(str.getArrayAfterRegex(regex:"^Hello"))
//    //["Hello"]
    
    func test() {
        let regex = try! NSRegularExpression(pattern: regex)
        
        words.filter { word in
            word.match(with: regex)
        }.forEach {
            print($0)
        }
    }
}

struct SuffixRegex {
    let regex = "main" // top으로 시작
    
    let words = [
        "top_hot_main",
        "top_hot_normal",
        "top_rank_all",
        "top_rank_fantasy_drama",
        "top_rank_romance",
    ]
    
    func test() {
        let result = words.filter {
            $0.range(of: regex) != nil
        }
        print(result)
    }
}
