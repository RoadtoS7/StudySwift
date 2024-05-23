//
//  KVOExamples.swift
//  StudySwift
//
//  Created by nylah.j on 3/25/24.
//

import Foundation

class KVOObject: NSObject {
    @objc dynamic var name: String
    @objc dynamic var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class KVOExamplesTest {
    func test() {
        let obj = KVOObject(name: "Json", age: 19)
        let personName = obj.value(forKey: "name") as? String
        print("name: ", personName)
        
    obj.setValue("prime", forKey: "name") as? String
    }
}


