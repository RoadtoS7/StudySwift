//
//  AsycnSyncSerialConcurrent.swift
//  StudySwift
//
//  Created by nylah.j on 2023/08/04.
//

import Foundation


/***
 Synk: 동기 -> 호출하는 쪽의 실행순서 보장 (block이 실행완료된 후에 다음 코드 라인으로 넘어감)
 Asynk: 비동기
 */

/**
 Serial: 큐에 쌓이는 작업 간에 순서 보장
 Concurrent: 큐에 쌓이는 작업간에 순서 보장 안됨
 */

class AsycnSyncSerialConcurrent {
    deinit {
        print("$$ AsycnSyncSerialConcurrent - deinit")
    }
    func asyncAfter() {
        // escaping closure
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("$$ asyncAfter - escaping closure")
        }
        
        // escaping closure
        DispatchQueue.main.async {
            print("$$ async - escaping closure")
        }
        
        // escaping closure
        DispatchQueue.main.sync {
            print("$$ sync - escaping closure")
        }
    }
}
