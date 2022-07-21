////
////  what problem opaquetype does solve .swift
////  StudySwift
////
////  Created by nylah.j on 2022/05/17.
////
//
//import Foundation
//
//// OpaqueType은 모듈에서 구체적인 반환타입을 클라이언트에게 숨길 때 사용된다.
//
//protocol Shape {
//    func draw() -> String
//}
//
//struct Triangle: Shape {
//    var size: Int
//    func draw() -> String {
//        var result: [String] = []
//        for length in 1...size {
//            result.append(String(repeating: "*", count: length))
//        }
//        return result.joined(separator: "\n")
//    }
//}
//
//struct FlippedShape<T: Shape>: Shape {
//    var shape: T
//    func draw() -> String {
//        let lines = shape.draw().split(separator: "\n")
//        return lines.reversed().joined(separator: "\n")
//    }
//
//    static func test() {
//        let smallTriangle = Triangle(size: 3)
//        let flippedShape = FlippedShape(shape: smallTriangle)
//        print(smallTriangle.draw())
//    }
//}
//
//struct JoinedShape<T: Shape, U: Shape>: Shape {
//    var top: T
//    var bottom: U
//    func draw() -> String {
//        return top.draw() + "\n" + bottom.draw()
//    }
//
//    static func test() {
//        let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
//        print(joinedTriangles.draw())
//    }
//}
