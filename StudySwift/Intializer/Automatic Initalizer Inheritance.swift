//
//  Intializer.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/29.
//

import Foundation

/**
 Automatic Initalizer Inheritance
 조건1. subclass가 designated intialzier를 정의하지 않는다. -> super class의 desigated initializer를 자동으로 상속받는다.
 조건2. subclass가 super class의 desiganted initializer를 모두 정의한다. -> super class의 convenience initializer를 자동으로 상속받는다.
 */

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unamed]")
    }
}

/**
Food 클래스의 모든 designated class를 구현함. -> super 클래스의 convenience initializer를 자동으로 상속받는다.
 */
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    convenience override init(name: String) { // Food 클래스의 designated class를 구현한 intializer
        self.init(name: name, quantity: 1)
    }
    
    // init() : super class의 convenience initializer를 상속받아 생긴 것
}

/**
 designated initalizer를 정의하지 않는다. (조건1 충족)
 -> super 클래스의 designated intializer를 상속받는다. (조건2 충족)
 -> super 클래스의 convenience intailizer를 상속받는다.
 */
class FoodCartItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "✔" : "x"
        return output
    }
    
    // init(name: String, quantity: Int) : super class의 designated initializer를 상속받아 생긴 것
    
    // init(name: String) : super class의 convenience initializer를 상속받아 생긴 것
    
    // init() : super class의 convenience initializer를 상속받아 생긴 것
}

