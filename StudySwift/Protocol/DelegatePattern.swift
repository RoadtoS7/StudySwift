//
//  DelegatePattern.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/01.
//

import Foundation

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongrentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
                   .truncatingRemainder(dividingBy:m))
               return lastRandom / m
    }
    
    static func test() {
        let generator = LinearCongrentialGenerator()
        print("Here's a random number: \(generator.random())")
        print("Add anothre one: \(generator.random())")
    }

}

struct Dice  {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

// 주사위를 사용하는 게임이 따라야할 프로토콜
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

/**
 1. 책임을 위임할 객체가 따라야할 프로토콜
 2. Dice 게임이 시작되었을 때, 종료되었을 때마다 특정 로직을 수행해야 하는 객체가 다르는 protocol
 => 한 객체의 상태 변화가 일어날 때, 일어나야 하는 이벤트를 delegate 패턴으로 구현한다.
 */
//
//

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ gmae: DiceGame, didStartNewTurnWithDice diceRoll : Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadder: DiceGame {
    let finalSqure = 25
    var dice: Dice = Dice(sides: 6, generator: LinearCongrentialGenerator())
    var square = 0
    var board: [Int]
    
    init() {
        board = Array(repeating: 0, count: finalSqure + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    weak var delegate: DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSqure {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDice: diceRoll)
            switch square + diceRoll {
            case finalSqure:
                break gameLoop
            case let newSquare where newSquare > finalSqure:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
    
    static func test() {
        let tracker = GameTracker()
        let game = SnakesAndLadder()
        game.delegate = tracker
        game.play()
    }
}

class GameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadder {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using \(game.dice.sides)-sided dice")
    }
    
    
    func game(_ gmae: DiceGame, didStartNewTurnWithDice diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
