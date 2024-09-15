//
//  TruckCorrsingTheBridge.swift
//  StudySwift
//
//  Created by nylah.j on 9/15/24.
//
// 프로그래머스 > 큐/스택 > 다리를 건너는 트랙

import Foundation

final class TruckCorrsingTheBridge {
    func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
        var currentTime: Int = 0
        var bridgeCapacity: Int = weight
        var bridgeQueue: [(Int, Int)] = []
        var truckQueue: [Int] = truck_weights
        
        repeat {
            currentTime += 1
            
            if let (truckWeight, endTime) : (Int, Int) = bridgeQueue.first,
               endTime == currentTime {
                bridgeQueue.removeFirst()
                bridgeCapacity += truckWeight
            }
            
            if let truckWeight = truckQueue.first,
               bridgeCapacity >= truckWeight {
                bridgeCapacity -= truckWeight
                truckQueue.removeFirst()
                let endTime = currentTime + bridge_length
                bridgeQueue.append((truckWeight, endTime))
            }
        } while truckQueue.isEmpty == false || bridgeQueue.isEmpty == false
        
        return currentTime
    }
    
    static func test() {
        [
            (2,    10,    [7,4,5,6]),
            (100,    100,    [10]),
            (100,    100,   [10,10,10,10,10,10,10,10,10,10])
        ].forEach {
            let result = TruckCorrsingTheBridge().solution($0, $1, $2)
            print("$ result: ", result)
        }
    }
}
