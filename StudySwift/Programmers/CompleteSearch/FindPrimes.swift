//
//  FindPrimes.swift
//  StudySwift
//
//  Created by nylah.j on 8/9/24.
//

import Foundation

final class FindPrimes {
    func solution(_ numbers:String) -> Int {
        let allNumbers: [Int] = findAllNumbers(numbers).map {
            Int($0)!
        }
        
        let maxNumber: Int = allNumbers.max()!
        var che: [Bool] = [Bool](repeating: true, count: maxNumber + 1)
        
        che[0] = false
        che[1] = false
        let sqrtNumber: Int = Int(sqrt(Double(maxNumber)))
        for i in (2...sqrtNumber) {
            if che[i] == true { // 가장 작은 수를 찾는다.
                // 그 수의 배수를 제거한다.
                var j: Int = 2
                while i * j <= maxNumber {
                    che[i*j] = false
                    j += 1
                }
            }
        }
        
        var result: Int = 0
        for number in allNumbers {
            if che[number] == true {
                result += 1
            }
        }
        
        return result
    }
    
    func findAllNumbers(_ numbers: String) -> [String] {
        var allNumbers: [String] = []
        
        func findAllNumbers(numberCount: Int, currentNumber: String) {
            if currentNumber.count == numberCount {
                allNumbers.append(currentNumber)
                return
            }
        
            for number in numbers {
                if currentNumber.contains(number) == false {
                    findAllNumbers(numberCount: numberCount, currentNumber: currentNumber + String(number))
                }
            }
        }
        
        for number in numbers {
            allNumbers.append(String(number))
        }
        
        for i in (2...numbers.count) {
            findAllNumbers(numberCount: i, currentNumber: "")
        }
        
        return allNumbers
    }
}
