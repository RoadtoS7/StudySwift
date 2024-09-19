//
//  Number1.swift
//  StudySwift
//
//  Created by nylah.j on 9/19/24.
//

import Foundation

final class Number1 {
    func solution(_ taxes: [[Int]], _ income: Int) -> Int {
        let taxCount = taxes.count
        let taxIncomes: [Int] = taxes.map { $0[0] }
        var totalTax: Int = .zero
        
        for i in 0..<taxCount {
            let startIncome: Int = (i == .zero) ? 0 : taxIncomes[i-1]
//            let endIncome: Int = (i == taxCount) ? .max : taxIncomes[i]
            let endIncome: Int = (taxIncomes[i] == .zero) ? .max: taxIncomes[i]
            
            print(startIncome, income, endIncome)
            if startIncome < income {
                let taxIncome = income >= endIncome ? (endIncome - startIncome) : (income - startIncome)
                print("taxIncome? ", taxIncome)
                
                let percent: Double = Double(taxes[i][1]) / Double(100)
                print(" percent: ", percent)
                
                let tax: Int = Int(ceil(Double(taxIncome) * percent))
                print(tax)
                totalTax += tax
            }
        }
        
        return totalTax
    }
    static func test() {
        [
            ([[1000, 1], [0, 10]], 2000),
//            ([[1200, 6], [4600, 15], [8800, 24], [15000, 35]], 9500)
        ].forEach {
            print("result? ", Number1().solution($0, $1))
        }
    }
}
