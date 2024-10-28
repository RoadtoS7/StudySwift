//
//  main.swift
//  StudySwift
//
//  Created by nylah.j on 2022/02/15.
//

import Foundation
import Combine




let actorTest = ActorTaskRelationShipTest()
await actorTest.test()

// 비동기 작업이 완료될 때까지 대기하도록 지연 시간을 줍니다.
try? await Task.sleep(nanoseconds: 1_000_000_000)





