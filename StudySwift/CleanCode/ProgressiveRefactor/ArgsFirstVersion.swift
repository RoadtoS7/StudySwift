//
//  ArgsFirstVersion.swift
//  StudySwift
//
//  Created by nylah.j on 1/31/24.
//

import Foundation

public class ArgsFirstVersion {
    private let schema: String
    private let args: [String]
    
    private var valid: Bool = true
    private var unexpectedArguments: Set<Character> = .init()
    private var booleanArgs: [Character:Bool] = .init()
    private var numberOfArguments: Int = .zero
    
    
    init(schema: String, args: [String]) {
        self.schema = schema
        self.args = args
        valid = parse()
    }
    
    public func isValid() -> Bool {
        return valid
    }
    
    private func parse() -> Bool {
        if schema.count == .zero && args.count == .zero {
            return true
        }
        
        parseSchema()
        parseArguments()
        return unexpectedArguments.count == .zero
    }
    
    private func parseSchema() -> Bool {
        for element in schema.split(separator: ",") {
            parseSchemaElement(String(element))
        }
        return true
    }
    
    private func parseSchemaElement(_ element: String) {
        if element.count == 1 {
            parseBooleanSchemaElement(element)
        }
    }
    
    private func parseBooleanSchemaElement(_ element: String) {
        let c = element.first
        if let c = c, c.isLetter {
            booleanArgs[c] = false
        }
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
        if isBoolean(argChar: argChar) {
            numberOfArguments += 1
            setBooleanArg(argChar: argChar, value: true)
        } else {
            unexpectedArguments.insert(argChar)
        }
    }
    
    private func setBooleanArg(argChar: Character, value: Bool) {
        booleanArgs[argChar] = value
    }
    
    private func isBoolean(argChar: Character) -> Bool {
        booleanArgs.keys.contains(argChar)
    }
    
    public func cardinality() -> Int {
        return numberOfArguments
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
            return ""
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
        return booleanArgs[arg] ?? false
    }
}
