//
//  Extension Protocol .swift
//  StudySwift
//
//  Created by nylah.j on 2022/04/13.
//

import Foundation

protocol LinkHandler {
    func canHandle(url: String) -> Bool
    func handle(url: String)
}

extension LinkHandler {
    func canHandle(url: String) -> Bool {
        url.contains("https")
    }
}

class LinkHandlerTest: LinkHandler {
    func handle(url: String) {
        print("handle: Url \(url)")
    }
}
