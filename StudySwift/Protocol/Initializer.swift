//
//  Initializer.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/01.
//

import Foundation

/**
 1. protocol에서 initalizer도 가질 수 있다.
 2. 클래스에서 프로토콜에 정의된 initializer를 구현할 때, required 키워드를 붙여야 한다.
 이유: 부모 클래스가 따르는 프로토콜을 자식 클래스에서도 따라야 한다. 따라서 자식 클래스에서도 프로토콜의 initalizer를 꼭 갖도록 만들기 위해서.
 3. final로 선언된 클래스라면, required를 붙이지 않아도 된다.
 4. 자식 클래스에서 intialzier를 갖는 프로토콜을 따를때, 이미 부모 클래스로부터 프로토콜의 initailizer와 동일한 것을 상속받는 다면
 -> required ovvride를 붙여야 한다.
 */

protocol DefaultInitalizable {
    init()
}

class DefaultInitializer: DefaultInitalizable {
    required init() {}
}

final class FinalClas: DefaultInitalizable {
    init() {}
}

class SuperClass {
    init() {}
}

class SubClass: SuperClass, DefaultInitalizable {
    required override init() {}
}

protocol FailableIntializable {
    init?()
}

class FailableIntialzier: FailableIntializable {
    required init() {}
}

class NonfailableInitializer: DefaultInitalizable {
    required init!() {}
}


