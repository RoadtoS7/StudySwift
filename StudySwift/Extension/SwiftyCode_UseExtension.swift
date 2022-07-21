//
//  SwiftyCode_UseExtension.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/12.
//

import Foundation

extension String {
    func lastCharacter() -> Character {
        return self.last ?? Character("")
    }
}
