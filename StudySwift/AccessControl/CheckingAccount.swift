//
//  CheckingAccount.swift
//  StudySwift
//
//  Created by nylah.j on 4/1/24.
//

import Foundation

class CheckingAccount: BasicAccount {
  private let accountNumber = UUID().uuidString

  class Check {
    let account: String
    var amount: Dollars
    private(set) var cashed = false

    func cash() {
      cashed = true
    }

    init(amount: Dollars, from account: CheckingAccount) {
      self.amount = amount
      self.account = account.accountNumber // nested class는 account number 접근 가능
    }
  }
    
    // 수표 작성
    func writeCheck(amount: Dollars) -> Check? {
      guard balance > amount else {
        return nil
      }

      let check = Check(amount: amount, from: self)
      withdraw(amount: check.amount)
      return check
    }

    // 수표 사용 여부 체크 -> 수표 금액만큼 적립
    func deposit(_ check: Check) {
      guard !check.cashed else {
        return
      }

      deposit(amount: check.amount)
      check.cash()
    }
}

class TestAccessControl {
    static func test() {
        let johnChecking = CheckingAccount()
        johnChecking.deposit(amount: 300.00)
        
        let check = johnChecking.writeCheck(amount: 200.0)!
        
        let janeChecking = CheckingAccount()
        janeChecking.deposit(check)
        print("$$ janeChecking.balance", janeChecking.balance) // 200.0
        
        janeChecking.deposit(check)
        print("$$ janeChecking.balance", janeChecking.balance) // 위에서 check를 사용함
        
        check.cash()
//        check.cashed = true
        // check 사용자가 check를 이미 사용했다고 표시하도록 한다.
        // check uncash 메서드가 없으므로 사용 취소는 못한다.
        
        check.account // account에 CheckingAccount에서는 접근 불가하지만 Check를 통해서는 접근가능하다.
    }
}

extension TestAccessControl {
    class Subclass {
        var subclass: Int = 0
    }
}

private class PrivateClassPropertyTypeCheck {
    fileprivate let title: String // private을 붙이지 않으면 fileprivate 인가 아니면 internal 인가? internal 이라면 다른 파일에서 접근하면 가능해야 한다.
    
    let defaultTitle: String = "" // fileprivate이다.
    
    private let privateTitle: String = ""
    
    init(title: String) {
        self.title = title
    }
    
    func defaultPrint() {
        print("$$")
    }
    
    private func privatePrint() {
        print("$$")
    }
}

private extension PrivateClassPropertyTypeCheck {
    var defaultExtensionProperty: String {
        ""
    }
    
    func defaultExtensionMethod() {
        print("$$ ")
    }
}

extension TestAccessControl {
    static func testPrivateClassProperty() {
        let check = PrivateClassPropertyTypeCheck(title: "이것은 타이틀")
        print("$$ check.title: ", check.title) // PrivateClassPropertyTypeCheck과 같은 파일에 위치하고 있기 때문에 접근 가능
    }
}

class PrivateClassAccessAtSameFile {
    // 사용은 할 수 있지만 파일 외부로 유출되어선 안된다!!
    // 따라서 private이나 fileprivate으로 선언되어 사용되어야 한다.
    fileprivate let privateClass: PrivateClassPropertyTypeCheck = .init(title: "private class 프로퍼티의 기본 타입은 internal?")
    
    // 접근제어자로 아무것도 지저앟지 않은 프로퍼티로 접근할 수 있다.
    func accessDefaultProperty() {
        print("$$ ", privateClass.defaultTitle)
    }
    
    func accessDefaultMethod() {
        privateClass.defaultPrint()
    }
    
    // private class 내부의 private 프로퍼티는 접근할 수 없다.
//    func accessPrivateProperty() {
//        print("$$ ", privateClass.privateTitle)
//    }
    
    // private class 내부의 private 메서드는 접근할 수 없다.
//    func accessPrivateMethod() {
//        privateClass.privatePrint()
//    }
    
    // private extension 에 존재하는 프로퍼티/메서드도 같은 파일에 존재한다면 접근가능하다.
    func accessExtensionMethodAndProperty() {
        print("$$ ", privateClass.defaultExtensionProperty)
        privateClass.defaultExtensionMethod()
    }
}

fileprivate class FilePrivateTypeCheck {
    let defaultProperty: String = ""
    func defaultMethod() {
        print("$$")
    }
}

class FilePrivateClassAccess {
    private let fileprivateClass: FilePrivateTypeCheck = .init()
    
    func accessDefaultProperty() {
        print("$$", fileprivateClass.defaultProperty)
    }
    
    func accessDefaultMethod() {
        fileprivateClass.defaultMethod()
    }
}


// MARK: - PrivateClass의 Extension에서 접근할 수 있는 메서드/프로퍼티 확인
private extension PrivateClassPropertyTypeCheck {
    func accessDefaultProperty() {
        print("$$ ", privateTitle)
    }
    
    func accessPrivateProperty() {
        
    }
}
 
