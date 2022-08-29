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
