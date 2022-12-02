//
//  Array.swift
//  StudySwift
//
//  Created by nylah.j on 2022/08/29.
//

import Foundation

/// default value를 갖는 Array 만들기
func createArrayWith(defaulValue: Int, count: Int) {
    let array = Array(repeating: defaulValue, count: count)
    let result = array.reduce(into: "array with default value: ") { partialResult, element in
        partialResult += "\(element),"
    }
    
    print("result: \(result)")
}

func createArray<T>(withlhs lhs: [T], rhs: [T]) -> [T] {
    lhs + rhs
}

func appendingArrayTest(withValue value: [String]) -> [String] {
    var shoppingList: [String] = ["Eggs", "Milk"]
    shoppingList.append("Flour")
    shoppingList += ["Flour"]
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    return shoppingList
}

func testSubscriptWithRange(withValue value: [String]) -> [String] {
    var shoppingList: [String] = ["Eggs", "Milk"]
    shoppingList += ["Flour"]
    shoppingList += ["Baking Powder"]
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    shoppingList[4...6] = ["Bananas", "Apples"]
    return shoppingList
}

func testArrayIndeces() {
    var shoppingList: [String] = ["Eggs", "Milk"]
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    shoppingList[2...4] = ["Bananas", "Apples"]
    print(shoppingList)
    // ["Eggs", "Milk", "Bananas", "Apples"]
    shoppingList.indices.forEach { print($0)}
}

/// toss 기출
struct TossArrayWithMemory {
    func testLargeArray() {
        var numbers = Array(repeating: 0, count: 1_000_000)
        var newNumbers = numbers
        
        let format = "%p"
        let numberString = String(format: format, numbers)
        let newnumberString = String(format: format, newNumbers)
        
        printAddress(fo: numbers)
        printAddress(fo: newNumbers)
        // %p를 이용해서 출력할 때랑, unsafe pointer를 사용할 때랑 다른 점이 무엇?
        
        // 0x10119fbf0
        // 0x10119fee0
        
    }
    
    // 큰 배열을 넘기면, 배열의 값을 복사하는데 큰 비용이 든다
    private func foo(_ numbers: [Int]) -> Int {
        numbers.count
    }
    
    func testSolarSystem() {
        let planets: Set = ["Sun", "Earth", "Venus"]
        var solarSystem = planets
        solarSystem.insert("sun")
        
        printAddress(fo: planets)
        printAddress(fo: solarSystem)
    }
    
}
