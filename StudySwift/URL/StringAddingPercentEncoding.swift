//
//  StringAddingPercentEncoding.swift
//  StudySwift
//
//  Created by nylah.j on 2022/06/02.
//

import Foundation


struct URLTest {
    func test() {
        let urlString = "https://github.com/sujinnaljin?tab=repositories"
        // characterSet에 포함되지 않는 문자를 percent 인코딩한다.
        // url로 인코딩할 때는 urlQueryAllowed를 사용
        // percent encoding이 무엇? URL에서 의미를 갖는 8bit의 문자열로 바꾸는 것, URL 인코딩이라고도 한다.
        
        /**
         https://github.com/sujinnaljin?tab=repositories
         
         urlQueryAllowed
         https://github.com/sujinnaljin?tab=repositories
         
         urlFragmentAllowed
         https://github.com/sujinnaljin?tab=repositories
         
         urlHostAllowed
         https%3A%2F%2Fgithub.com%2Fsujinnaljin%3Ftab=repositories
         
         urlPathAllowed
         https%3A//github.com/sujinnaljin%3Ftab=repositories
         
         urlPasswordAllowed
         https%3A%2F%2Fgithub.com%2Fsujinnaljin%3Ftab=repositories
         
         urlUserAllowed
         https%3A%2F%2Fgithub.com%2Fsujinnaljin%3Ftab=repositories%
         */
        
        // CharacterSet.urlQueryAllowed: url에서 쿼리 문에 사용될 수 있는 CharacterSet
        // tab=repositories에 해당
        // 일반적으로 문자열을 url로 인코딩할 때 이것을 사용한다.
        let urlQueryAllowed = urlString.addingPercentEncoding(withAllowedCharacters:  .urlQueryAllowed)
        print("urlQueryAllowed: \(String(describing: urlQueryAllowed))")
        
        
        // .urlFragmentAllowed: url에서 fragment 문에 사용될 수 있는 CharacterSet
        // CharacterSet.urlQueryAllowed 구성요소와 동일
        let urlFragmentAllowed = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        print("urlFragmentAllowed: \(String(describing: urlFragmentAllowed))")
    }
}
