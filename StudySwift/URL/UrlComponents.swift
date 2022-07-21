//
//  UrlComponents.swift
//  StudySwift
//
//  Created by nylah.j on 2022/07/21.
//

import Foundation


struct UrlComponentesTest {
    static func test_host가_어디까지인가() {
        let deeplink = "kakaowebtoon://test/path1/path2?key1=value1"
        let url = URLComponents(string: deeplink)
        
        print("deeplink host: \(url?.host)")
        print("deeplink path: \(url?.path)")
        print("deeplink: query: \(url?.query)")
        print("deeplink: queryItems: \(url?.queryItems)")
        print("deeplink pathComponents: \(url?.url?.pathComponents))")
        
//        deeplink host: Optional("test")
//        deeplink path: Optional("/path1/path2")
//        deeplink: query: Optional("key1=value1")
//        deeplink: queryItems: Optional([key1=value1])
//        deeplink pathComponents: Optional(["/", "path1", "path2"]))
        
        let deeplink2 = "kakowebtoon://test/path1"
        let url2 = URLComponents(string: deeplink2)
        print("deeplink2 host: \(url2?.host)")
        print("deeplink2 path: \(url2?.path)")
        print("deeplink2: query: \(url2?.query)")
        print("deeplink2: queryItems: \(url2?.queryItems)")
        print("deeplink2 pathComponents: \(url2?.url?.pathComponents))")
        
//        deeplink path: Optional("/path1")
//        deeplink: query: nil
//        deeplink: queryItems: nil
//        deeplink2 pathComponents: Optional(["/", "path1"]))
        
        let https = "https://www.kakaowebtoon.com/path1/path2/path3"
        let httpsLink = URLComponents(string: https)
        print("httpsLink host: \(httpsLink?.host)")
        print("httpsLink path: \(httpsLink?.path)")
        print("httpsLink: query: \(httpsLink?.query)")
        print("httpsLink queryItems: \(httpsLink?.queryItems)")
        print("httpsLink pathComponents: \(httpsLink?.url?.pathComponents))")
        
//        httpsLink host: Optional("www.kakaowebtoon.com")
//        httpsLink path: Optional("/path1/path2/path3")
//        httpsLink: query: nil
//        httpsLink: queryItems: nil
//        httpsLink pathComponents: Optional(["/", "path1", "path2", "path3"]))
    }
}
