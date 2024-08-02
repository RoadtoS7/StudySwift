//
//  NoncopyableTest.swift
//  StudySwift
//
//  Created by nylah.j on 6/12/24.
//

import Foundation

// 여러 곳에서 file description을 닫는 것을
// 메모리 누수 방지
// 모든 generic에도 지원
// optional -> init?() 사용 가능, Result, Unsafe Pointers
struct NoncopyableFile: ~Copyable {
    private let fd: CInt
    
    init(description: CInt) {
        self.fd = description
    }
    
    func write(buffer: [UInt8]) {
        // ...
    }
    
    deinit {
        close(fd)
    }
}

class NoncopyableTest {
    static func test() {
        
    }
}
