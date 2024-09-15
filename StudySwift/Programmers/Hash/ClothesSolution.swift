//
//  ClothesSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class ClothesSolution {
    func solution(_ clothes:[[String]]) -> Int {
        var closet: [String: [String]] = [:]
        
        for cloth in clothes {
            let (name, type) = (cloth[0], cloth[1])
            
            if let names = closet[type] {
                closet[type] = names + [name]
            } else {
                closet[type] =  [name]
            }
        }
        
        // 1개만 고르는 경우, 2개만 고르는 경우
        let setCount = closet.reduce(into: 1) { partialResult, closet in
            partialResult *= (closet.value.count + 1)
        }
        return setCount - 1
    }
    
    
    func solution2(_ clothes: [[String]]) -> Int {
        typealias Closet = [String : [String]]

        let count: Int = clothes.map { cloth in
            (name: cloth[0], type: cloth[1])
        }.reduce(into: Closet()) { partialResult, cloth in
            let clothes = partialResult[cloth.type, default: []]
            partialResult[cloth.type] = clothes + [cloth.name]
        }.reduce(into: 1) { partialResult, dict in
            partialResult *= (dict.value.count + 1)
        }
        
        return count - 1
    }
    
    
    static func test() {
        [
            [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]],
            [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]],
            [["crow_mask", "face"]]
        ].forEach { clothes in
            print(ClothesSolution().solution2(clothes))
        }
        
    }
}
