//
//  ProgressiveRefactorProcessor.swift
//  StudySwift
//
//  Created by nylah.j on 1/31/24.
//

import Foundation

class ProgressiveRefactorProcessor {
    static func run(args: [String]) {
//        try {
//            let arg = Args("l,/p#,d*", args)
//            let logging: Bool = arg.getBoolean("l")
//            let port = arg.getInt("p")
//            let directory = arg.getString("d")
//            excuteApplication(logging, port, directory)
//        } catch let error as? ArgsException {
//            print("$$ Argument error: %s\n", error.errorMessagE())
//        }
    }
}

fileprivate enum ErrorCode {
    case OK, MISSING_STRING(errorArgument: Character)
    
    var message: String {
        switch self {
        case .OK:
            return "TILT: Should Not Get Here"
        case .MISSING_STRING(let errorArgument):
            return "Could not find string parameter for -\(errorArgument)"
        }
    }
    
}


public class Args {
    enum ParseException: Error {
        case badCharaterInArg(badChracter: Character)
        case indexOutOfRange
        
        var message: String {
            switch self {
            case .badCharaterInArg(let badChracter):
                return "Bad character \(badChracter) in Arguement "
            default:
                return "\(self)"
            }
        }
    }
    
    private let schema: String
    private let args: [String]
    
    private var valid: Bool = true
    private var unexpectedArguments: Set<Character> = .init()
    
    // Step2: booleanCargs에서 Bool 대신 marshaler를 설정한다.
    private var booleanArgs: [Character : ArgumentMarshaler] = .init()
    private var stringArgs: [Character:String] = .init()
    private var intArgs: [Character:Int] = .init()
    
    private var argsFound: Set<Character> =  .init()
    private var currentArgument: Int = .zero

    private var errorArgument: String = "\0"
    private var errorCode: ErrorCode = .OK
    
    
    init(schema: String, args: [String]) {
        self.schema = schema
        self.args = args
        valid = (try? parse()) ?? false
    }
    
    private func parse() throws -> Bool {
        if schema.count == .zero && args.count == .zero {
            return true
        }
        
        try parseSchema()
        parseArguments()
        return unexpectedArguments.count == .zero
    }
    
    private func parseSchema() throws -> Bool {
        for element in schema.split(separator: ",") {
            if element.count > 0 {
                let trimmedElement = element.trimmingCharacters(in: .whitespaces)
                try parseSchemaElement(String(trimmedElement))
            }
        }
        return true
    }
    
    private func parseSchemaElement(_ element: String) throws {
        let elementId = element.first ?? Character("")
        let secondIndex = element.index(after: element.startIndex)
        let elementTail = element.substring(from: secondIndex)
        
        try validateSchmeaElementId(elementId)
        
        if isBooleanSchemaElement(elementTail: elementTail) {
            parseBooleanSchemaElement(elementId)
        }
        else if isStringSchemaElement(elementTail: elementTail) {
            parseStringSchemaElement(elementId)
        }
        else if isIntSchemaElement(elementTail: elementTail) {
            parseIntSchemaElement(elementId)
        }
    }
    
    private func validateSchmeaElementId(_ elementId: Character) throws {
        if elementId.isLetter == false {
            throw ParseException.badCharaterInArg(badChracter: elementId)
        }
    }
    
    // 반복해서 추가해주어야 하는 것
    private func isBooleanSchemaElement(elementTail: String) -> Bool {
        return elementTail.count == .zero
    }
    
    // 반복해서 추가해주어야 하는 것
    private func parseBooleanSchemaElement(_ element: Character) {
        booleanArgs[element] = BooleanArgumentMarshaler()
    }
    
    
    private func isStringSchemaElement(elementTail: String) -> Bool {
        return elementTail.elementsEqual("*")
    }
    
    private func parseStringSchemaElement(_ elementId: Character) {
        stringArgs[elementId] = ""
    }
    
    
    private func isIntSchemaElement(elementTail: String) -> Bool {
        return elementTail.elementsEqual("d")
    }
    
    private func parseIntSchemaElement(_ elementId: Character) {
        intArgs[elementId] = .zero
    }

    
    private func parseArguments() -> Bool {
        for arg in args {
            parseArgument(arg)
        }
        return true
    }
    
    private func parseArgument(_ arg: String) {
        if arg.starts(with: "-") {
            parseArgElement(arg: arg)
        }
    }
    
    private func parseArgElement(arg: String) {
        for c in arg {
            parseElement(argChar: c)
        }
    }
    
    private func parseElement(argChar: Character) {
        if setArgument(argChar) {
            argsFound.insert(argChar)
        } else {
            unexpectedArguments.insert(argChar)
            valid = false
        }
    }
    
    private func setArgument(_ argChar: Character) -> Bool {
        var set = true
        if isBoolean(argChar: argChar) {
            setBooleanArg(argChar: argChar, value: true)
        }
        else if isString(argChar: argChar) {
            setStringArg(argChar: argChar, s: "")
        }
        else if isIntArg(argChar: argChar) {
            
        }
        else {
            set = false
        }
        return set
    }
    
    private func setStringArg(argChar: Character, s: String) {
        currentArgument += 1
        
        if args.indices.contains(currentArgument) {
            stringArgs[argChar] = args[currentArgument]
            return
        }
        
        valid = false
        errorArgument = String(argChar)
        errorCode = .MISSING_STRING(errorArgument: argChar)
    }
    
    private func isString(argChar: Character) -> Bool {
        return stringArgs.keys.contains(argChar)
    }
    
    private func setBooleanArg(argChar: Character, value: Bool) {
        booleanArgs[argChar] = BooleanArgumentMarshaler()
    }
    
    private func isBoolean(argChar: Character) -> Bool {
        booleanArgs.keys.contains(argChar)
    }
    
    // 반복해서 추가해주어야 하는 것
    private func setIntArg(argChar: Character, value: Int) {
        
        intArgs[argChar] = value
    }
    
    // 반복해서 추가해주어야 하는 것
    private func isIntArg(argChar: Character) -> Bool {
        intArgs.keys.contains(argChar)
    }
    
    public func cardinality() -> Int {
        argsFound.count
    }
    
    
    public func usage() -> String {
        if schema.count > .zero {
            return "-[" + schema + "]"
        }
        else {
            return ""
        }
    }
    
    public func errorMessage() -> String {
        if unexpectedArguments.count > .zero {
            return unxpectedArgumentMessage()
        } else {
            return errorCode.message
        }
    }
    
    private func unxpectedArgumentMessage() -> String {
        var message = "Argument(s) - "
        
        for c in unexpectedArguments {
            message.append(c)
        }
        
        message.append(" unexpected")
        return message
    }
    
    public func getBoolean(arg: Character) -> Bool {
        falseIfNull(booleanArgs[arg]?.getBoolean())
    }
    
    private func falseIfNull(_ b: Bool?) -> Bool {
        if let b {
            return b
        }
        return false
    }
    
    public func getString(arg: Character) -> String {
        return blankIfNull(stringArgs[arg])
    }
    
    private func blankIfNull(_ s: String?) -> String {
        return s == nil ? "" : s!
    }
    
    public func getInt(arg: Character) -> Int {
        return .zero
    }
    
    public func has(arg: Character) -> Bool {
        argsFound.contains(arg)
    }
    
    public func isValid() -> Bool {
        return valid
    }
}

// Step1: 기본 골격을 만든다.
private class ArgumentMarshaler {
    private var booleanValue = false
    
    public func setBoolean(value: Bool) {
        booleanValue = value
    }
    
    public func getBoolean() -> Bool {
        booleanValue
    }
}

private class BooleanArgumentMarshaler: ArgumentMarshaler {
}

private class StringArgumentMarshaler: ArgumentMarshaler {
}

private class IntegerArgumentMarshaler: ArgumentMarshaler {
}


