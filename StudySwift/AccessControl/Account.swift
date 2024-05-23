//
//  Account.swift
//  StudySwift
//
//  Created by nylah.j on 4/1/24.
//

import Foundation


/// A protocol describing core functionality for an account
protocol Account {
  associatedtype Currency

  var balance: Currency { get }
  func deposit(amount: Currency)
  func withdraw(amount: Currency)
}


typealias Dollars = Double

// MARK: - Base Class의 subclass가 다른 프로퍼티에 존재한다면, 프로퍼티/메서드는 internal 로 선언
/// A U.S. Dollar based "basic" account.
class BasicAccount: Account {

  var balance: Dollars = 0.0

  func deposit(amount: Dollars) {
    balance += amount
  }

  func withdraw(amount: Dollars) {
    if amount <= balance {
      balance -= amount
    } else {
      balance = 0
    }
  }
}
