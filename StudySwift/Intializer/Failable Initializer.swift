//
//  Failable Initializer with Enumerations.swift
//  StudySwift
//
//  Created by nylah.j on 2022/03/29.
//

import Foundation

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
