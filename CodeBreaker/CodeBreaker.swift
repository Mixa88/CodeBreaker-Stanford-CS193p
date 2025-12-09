//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Михайло Тихонов on 09.12.2025.
//

import SwiftUICore

typealias Peg = Color

struct CodeBreaker {
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = []
    var pegChoices: [Peg] = [.red, .green, .blue, .yellow]
    
    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt
        
        attempts.append(attempt)
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if  let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missing
        }
    }
}
    

struct Code {
    
    var kind: Kind
    var pegs: [Peg] = [.green, .red, .red, .yellow]
    
    static let missing: Peg = .clear
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }
}
