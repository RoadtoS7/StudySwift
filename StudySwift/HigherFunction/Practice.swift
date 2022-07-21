//
//  Practice.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/12.
//

import Foundation

//연습 2
//요소가 수백개인 Array에 여러 단어가 포함되어 있습니다.
//
//단어의 길이가 12자를 초과하는 단어를 추출합니다.
//12자가 넘는 단어 중 길이가 긴 순서로 100개의 단어를 추출합니다.
//추출한 100개의 단어를 출력합니다. 모든 단어는 소문자로 출력해야합니다.

struct HigherFunction {
    static func partice2(words: [String]) {
        words.filter { $0.count > 12 }
        .sorted()
        .reversed()
        .suffix(100)
        .map { $0.lowercased() }
        .forEach { print($0) }
    }
}
