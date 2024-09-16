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
    
    func solution2(_ numbers:String) -> Int {
        let characters: [Character] = numbers.reduce(into: [Character]()) { partialResult, char in
            partialResult.append(char)
        }
            
        var used: [Bool] = .init(repeating: false, count: characters.count)
        let numberGroup = makeNumberList("", characters: characters, used: &used)
        let maxNumber = numberGroup.max()!
        
        let chec = makePrimeChe(maxNumber)
        let count = numberGroup.filter { chec[$0] }.count
        return count
    }
    
    
    func makeNumberList(_ numberString: String, characters: [Character], used: inout [Bool]) -> Set<Int> {
        var resultSet: Set<Int> = []
        
        for (i, character) in characters.enumerated() {
            guard used[i] == false else {
                continue
            }
            
            let newNumberString = numberString.appending(String(character))
            let newNumber = Int(newNumberString)!
            resultSet.insert(newNumber)
            
            used[i] = true
            let subResultSet = makeNumberList(newNumberString, characters: characters, used: &used)
            resultSet.formUnion(subResultSet)
            used[i] = false
        }
        
        return resultSet
    }
    
    func makePrimeChe(_ number: Int) -> [Bool] {
        var primeChec: [Bool] = .init(repeating: true, count: number + 1)
        primeChec[0] = false
        primeChec[1] = false
        
        let sqrtNumber: Int = Int(sqrt(Double(number)))
        
        for i in (2...(sqrtNumber)) {
            if primeChec[i] {
                for multiple in stride(from: i * i, through: number, by: i) {
                    primeChec[multiple] = false
                }
            }
        }
        
        return primeChec
    }
    
    static func test() {
        [
            "17",
            "011"
        ].forEach { str in
            print(FindPrimes().solution2(str))
        }
    }
}
