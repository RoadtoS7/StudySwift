//
//  CheckingAccount+.swift
//  StudySwift
//
//  Created by nylah.j on 4/1/24.
//

import Foundation

extension CheckingAccount {
    func accessPrivate() {
//        print("$$ self.accountNumber: ", self.accountNumber) // 같은 파일에 존재하는 extension만 private에 접근할 수 수있다.
    }
    
    class NestedClass {
        func accessPrivate() {
//            print("$$ self.accountNumber: ", self.accountNumber) // 같은 파일에 존재하는 extension만 private에 접근할 수 수있다.
        }
    }
}

//extension PrivateClassPropertyTypeCheck { // PrivateClassPropertyTypeCheck이 private/fileprivate이면 extension을 외부에 선언할 수 없다.
//    class Tester {
//        static func testPrivateClassProperty() {
//            let check = PrivateClassPropertyTypeCheck(title: "이것은 타이틀")
//            print("$$ check.title: ", check.title)
//        }
//    }
//}

//
//class PrivateClassAccessAtSameFile2 {
//    // PrivateClassPropertyTypeCheck와 같은 파일에 존재하지 않기 때문에 사용할 수 없다.
//    let privateClass: PrivateClassPropertyTypeCheck = .init(title: "private class 프로퍼티의 기본 타입은 internal?")
//    
//    func access() {
//        print("$$ ", privateClass.defaultTitle)
//    }
//}

