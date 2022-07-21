//
//  Failable Initializer with Enumerations.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/29.
//

import Foundation

/**
 with Enumerations
 */
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
    
    static func test() {
        let f = TemperatureUnit(symbol: "F")
        if f != nil {
            print("initialization succeed")
        }
        
        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("initialization fail")
        }
    }
}

/**
 for Enumerations with Raw Values
 */
enum TemperatureUnitWithRawValues: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
    
    static func test() {
        let fahrenheitUnit = TemperatureUnitWithRawValues(rawValue: "F")
        if fahrenheitUnit != nil {
            print("initialization succeed")
        }
        
        let unknownUnit = TemperatureUnitWithRawValues(rawValue: "X")
        if unknownUnit == nil {
            print("initialization fail")
        }
    }
}
