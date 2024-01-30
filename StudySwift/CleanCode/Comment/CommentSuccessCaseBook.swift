//
//  CommentSuccessCaseBook.swift
//  StudySwift
//
//  Created by nylah.j on 1/9/24.
//

import Foundation

/**
 이 클래스는 사용자가 지정한 최대값까지 소수를 구한다.
 알고리즘은 에라스토테네스 체다.
 2에서 시작하는 정수 배열을 대상으로 작업한다
 처음으로 남아있는 정수를 찾아 배수를 모두 제거한다.
 베열에 더이상 배수가 없을 때까지 반복한다.
 */
public class PrimeGenerator {
    private var crossedOut: [Bool] = []
    private var result: [Int] = []
    
    func generatePrime(maxValue: Int) -> [Int] {
        if maxValue < 2 { // 주석에서 설명했기 때문에 그냥 하는 것으로 보인다. 메서드로 빼도 상관없을 듯
            return []
        }
        else {
            uncrossIntegersUpTo(maxValue: maxValue) // cross out을 하는 행위로 보았다.
            crossOutMultiples() // cross out을 한다.
            putUncrossedIntegersIntoResult() // 결과에 담는다.
            return result // 이 구조는 PrimeGenerator를 static으로 만들어두는 게 좋네
        }
    }
    
    func uncrossIntegersUpTo(maxValue: Int) {
        (0...maxValue)
            .forEach { _ in
                crossedOut.append(false)
            }
    }
    
    func crossOutMultiples() {
        let limit = determinIterationLimit()
        for i in 2..<limit {
            if notCrossed(i: i) {
                crossOutMultiplesOf(i: i)
            }
        }
    }
    
    func determinIterationLimit() -> Int {
        // 배열에 있는 모든 배수는 배열 크기의 제곱근보다 작은 소수의 인수다.
        // 따라서 이 제곱근보다 더 큰 숫자의 배수는 제거할 필요가 없다.
        let iterationLimit = sqrt(Double(crossedOut.count))
        return Int(iterationLimit)
    }
    
    private func notCrossed(i: Int) -> Bool {
        return crossedOut[i] == false
    }
    
    private func crossOutMultiplesOf(i: Int) {
        var multiple = i * 2
        while multiple < crossedOut.count {
            crossedOut[multiple] = true
            multiple = multiple * 2
        }
    }
    
    func putUncrossedIntegersIntoResult() {
        var result = [Int]()
        for i in 0..<crossedOut.count {
            if notCrossed(i: i) {
                result.append(i)
            }
        }
        self.result = result
    }
}
