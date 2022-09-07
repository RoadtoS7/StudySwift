//
//  Set.swift
//  StudySwift
//
//  Created by nylah.j on 2022/08/29.
//

import Foundation

/**
 1. 형태: Set<Element>
 2. Array의 [] 처럼 간단하게 선언하는 방법 X
 3. 순서가 없이, 고유한 값을 담는다.(= 중복없다.)
 4. 타입을 명시적으로 지정할 때만 array literal [, , ]형태로 값 할당 가능
 */

///  4. 타입을 명시적으로 지정할 때만 array literal [, , ]형태로 값 할당 가능
func test_arrayliteral_할당() {
    let test: Set<String> = ["a", "b", "c"]
    test.forEach { print($0) }
//    let test = ["a", "b", "c"] // Array<String>가 할당된다.
    let test2: Set = ["a", "b", "c"] // 에러 안남
//    let test: Set = [] //에러 남 protocol 'Any' as a type cannot conform to 'Hashable'
}

func test_remove는_제거한_element를_반환_element가_존재하지않았으면_nil반환() {
    var favoriteGenres: Set = ["Rock", "Classical", "Hip Hop"]
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
}

func test_iterate_set_특정한_순서로() {
    let favortieGenres: Set = ["Rock", "Classical", "Hip Hop"]
    for genre in favortieGenres.sorted() {
        print(genre)
    }
}
