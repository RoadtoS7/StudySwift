//
//  main.swift
//  StudySwift
//
//  Created by nylah.j on 2022/02/15.
//

import Foundation
import Combine

Task { @MainActor in 
    // Task르
    print("$$ Thread.current.isMainThread", Thread.current.isMainThread)
}
Thread.sleep(forTimeInterval: 1000)

