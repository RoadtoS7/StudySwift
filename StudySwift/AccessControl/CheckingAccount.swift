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
    
    init(title: String) {
        self.title = title
    }
}

extension TestAccessControl {
    static func testPrivateClassProperty() {
        let check = PrivateClassPropertyTypeCheck(title: "이것은 타이틀")
        print("$$ check.title: ", check.title) // PrivateClassPropertyTypeCheck과 같은 파일에 위치하고 있기 때문에 접근 가능
    }
}
