//
//  main.swift
//  StudySwift
//
//  Created by nylah.j on 2022/02/15.
//

import Foundation
import Combine

let sample: Dictionary<Int, [[Int]]> = [
    9 : [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]],
    4 : [[1,2],[2,3],[3,4]],
    7 : [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]]
]



[
DictionaryTest().solution2("AAAAE"),
DictionaryTest().solution2("AAAE"),
DictionaryTest().solution2("I"),
 DictionaryTest().solution2("EIO")
].forEach { result in
    print(result)
}

