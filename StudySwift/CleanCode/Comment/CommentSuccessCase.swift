//
//  CommentSuccessCase.swift
//  StudySwift
//
//  Created by nylah.j on 1/8/24.
//

import Foundation

/**
 내가 작성한 버전
 */
class GeneratePrimesCleanVer {
    func generatePrimes(maxValue: Int) -> [Int] {
        if isLowerThanMinPrime(maxValue: maxValue) {
            return []
        }
        
        let primePerNumber = primePerNumber(maxValue: maxValue)
        let afterChe = filterEratorosChe(primePerNumber: primePerNumber)
        return makePrimeList(using: afterChe)
    }
    
    private func makePrimeList(using primePerNumber: Array<Bool>) -> [Int] {
        var primes = [Int]()
        for i in 0..<primePerNumber.count {
            if primePerNumber[i] {
                primes.append(i)
            }
        }
        return primes
    }
    
    private func countPrimeNums(in primePerNumber: Array<Bool>) {
        let s = primePerNumber.count
        var count = 0
        for i in 0...s-1 {
            if primePerNumber[i] {
                count += 1
            }
        }
    }
    
    private func filterEratorosChe(primePerNumber: Array<Bool>) -> Array<Bool> {
        var f = primePerNumber
        let s = primePerNumber.count
        var j = 0
        let cheMaxValueFloat: Float = sqrt(Float(s)) + 1.0
        let cheMaxValueInt: Int = Int(cheMaxValueFloat)
        
        for i in 2..<cheMaxValueInt {
            if f[i] {
                j = i * 2 // i가 남아있는 숫자라면 이 숫자의 배수를 구한다.
                while j < s {
                    f[j] = false // 배수는 소수가 아니다.
                    j += i
                }
            }
        }
        return primePerNumber
    }
    
    private func primePerNumber(maxValue: Int) -> Array<Bool> {
        var f = Array(repeating: true, count: maxValue + 1)
        f[0] = false
        f[1] = false
        return f
    }
    
    private func isLowerThanMinPrime(maxValue: Int) -> Bool {
        return maxValue < 2
    }
    
}
