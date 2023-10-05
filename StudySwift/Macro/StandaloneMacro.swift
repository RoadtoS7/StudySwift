//
//  StandaloneMacro.swift
//  StudySwift
//
//  Created by nylah.j on 2023/10/05.
//

import Foundation

/**
 Standalone 매크로
 1) 값 반환
 2) 액션
 */
/// function: Swift에서 제공하는 매크로, function name 반환
/// warning: yellow warning 생성
func test_StandAlone_Macro() {
    print("$$ Currently running \(#function)")
    #warning("Somthing's wrong")
}
