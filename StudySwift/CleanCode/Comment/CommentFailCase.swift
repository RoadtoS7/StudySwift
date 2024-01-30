//
//  Comment.swift
//  StudySwift
//
//  Created by nylah.j on 1/8/24.
//
// 4장 주석
// 4-7 잘못된 코드

import Foundation

class GeneratePrimes {
    static func generatePrimes(maxValue: Int) -> [Int] {
        if maxValue >= 2 { // 유일하게 유효한 경우
            // 선언
            let s = maxValue + 1 // 배열 크기
            var f = Array(repeating: false, count: s)
            
            // 배열을 참으로 초기화
            for i in 0...s-1 {
                f[i] = true
            }
            
            // 소수가 아닌 알려진 숫자를 제거
            f[0] = false
            f[1] = false
            
            // 체
            var j = 0
            let cheMaxValueFloat: Float = sqrt(Float(s)) + 1.0
            let cheMaxValueInt: Int = Int(cheMaxValueFloat)
            
            for i in 2..<cheMaxValueInt {
                if f[i] { // i가 남아있는 숫자라면 이 숫자의 배수를 구한다.
                    j = i * 2
                    while j < s {
                        f[j] = false // 배수는 소수가 아니다.
                        j += i
                    }
                }
            }
            
            // 소수 개수는?
            var count = 0
            for i in 0...s-1 {
                if f[i] {
                    count += 1
                }
            }
            
            var primes = [Int]()
            // 소수를 결과 배열로 이동한다.
            for i in 0..<s {
                if f[i] { // 소수일 경우에
                    primes.append(i)
                }
            }
            
            return primes // 소수를 반환한다.
        }
        else { // maxValue < 2
            return [Int]()
        }
    }
}
