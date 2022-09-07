//
//  Dictionary.swift
//  StudySwift
//
//  Created by nylah.j on 2022/08/29.
//

import Foundation

func test_updateValue() {
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("The old value for DUB was \(oldValue).")
    } else {
        print("value for DUB was set Dublin Airport.")
    }
}

func test_removeValue() {
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    if let removedValue = airports.removeValue(forKey: "DUB") {
        print("The removed airport's name is \(removedValue).")
    } else {
        print("The airports dictionary doesn't contain a value for DUB.")
    }
}

func test_for_iterate_dict() {
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    for (airportCode, airportName) in airports {
        print("(airportCode:\(airportCode) airportName: \(airportName))")
    }
}

func test_dict_values() {
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    print(type(of: airports.values)) // Dictionary<Key, Value>.Values
    // 따라서 Array 타입으로 얻고 싶으면, 타입 캐스팅 필요
    let valueArray = [String](airports.values)
    print("valueArray: \(valueArray)")
    print(type(of: valueArray)) // Array<String>
}

func test_dict_keys() {
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    print(type(of: airports.keys)) // Dictionary<Key, Value>.Keys
    // 따라서 Array 타입으로 얻고 싶으면, 타입 캐스팅 필요
    let keyArray = [String](airports.keys)
    print("keyArray: \(keyArray)")
    print(type(of: keyArray)) // Array<String>
}
