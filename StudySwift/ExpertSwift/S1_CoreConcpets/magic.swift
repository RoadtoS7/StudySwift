//
//  magic.swift
//  StudySwift
//
//  Created by nylah.j on 2022/12/02.
//

class Magic {
  func number() -> Int { return 0 }
}

final class SpecialMagic: Magic {
  override func number() -> Int { return 42 }
}

public var number: Int = -1

func magicTest() {
  let specialMagic = SpecialMagic() // swift는 클래스에서 v-table 디스패치 방식을 사용하기 때문이다. = 클래스의 v-table 을 사용한다.
  let magic: Magic = specialMagic
  number = magic.number() // 42
}

