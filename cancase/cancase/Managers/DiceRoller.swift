//
//  DiceRoller.swift
//  cancase
//
//  Created by Can Babaoğlu on 26.10.2023.
//

import Foundation

class DiceRoller {

    func roll() -> Int {
        let timeInterval = Date().timeIntervalSince1970
        let milliseconds = Int(timeInterval * 1000)
        return milliseconds % 6 + 1
    }
    
}
