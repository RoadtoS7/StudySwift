//
//  SwiftyCode_UseCustomProperty.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/12.
//

import Foundation

postfix operator --

extension String {
    static postfix func -- (string: Self) -> Character {
        return string.last ?? Character("")
    }
}
