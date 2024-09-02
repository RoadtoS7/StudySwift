//
//  CountWhere.swift
//  StudySwift
//
//  Created by nylah.j on 9/2/24.
//

import Foundation

final class CountWhere {
    func test() {
        let score = [100, 80, 85]
        let passCount = score.count { $0 > 85 }
    }
}
