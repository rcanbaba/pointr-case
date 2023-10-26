//
//  DiceRollerTest.swift
//  cancase
//
//  Created by Can Babaoğlu on 26.10.2023.
//

class DiceRollerTest {
    
    let diceRoller: DiceRoller
    let totalRolls = 600000 // value for test count
    
    init(diceRoller: DiceRoller) {
        self.diceRoller = diceRoller
    }
    
    func rollFrequencyTest() {
        var frequencies = [Int: Int]()
        
        for _ in 1...totalRolls {
            let result = diceRoller.roll()
            frequencies[result] = (frequencies[result] ?? 0) + 1
        }
        
        
        for i in 1...6 {
            if let freq = frequencies[i] {
                print("Number \(i) rolled \(freq) times.")
                DebugConsoleManager.shared.log(["rollFrequencyTest", "Number \(i) rolled \(freq) times."], userLogLevel: .info)
            } else {
                print("Number \(i) was never rolled.")
                DebugConsoleManager.shared.log(["rollFrequencyTest", "Number \(i) was never rolled."], userLogLevel: .error)
            }
        }
    }
    
    func rollBoundsTest() {
        for _ in 1...totalRolls {
            let result = diceRoller.roll()
            if result < 1 || result > 6 {
                DebugConsoleManager.shared.log(["rollBoundsTest", "rolled a number out of bounds: \(result)"], userLogLevel: .error)
                return
            }
        }
        DebugConsoleManager.shared.log(["rollBoundsTest", "All rolls are within bounds."], userLogLevel: .info)
    }
    
    func rollRepeatTest() {
        let maxRepeatedThreshold = 50  // Adjust the threshold
        var lastRoll: Int? = nil
        var currentStreak = 0
        
        for _ in 1...totalRolls {
            let result = diceRoller.roll()
            if result == lastRoll {
                currentStreak += 1
                if currentStreak >= maxRepeatedThreshold {
                    DebugConsoleManager.shared.log(["rollRepeatTest", "Number \(result) repeated \(currentStreak) times in a row."], userLogLevel: .error)
                    return
                }
            } else {
                currentStreak = 1
                lastRoll = result
            }
        }
        DebugConsoleManager.shared.log(["rollRepeatTest", "No unusual repeated sequences found."], userLogLevel: .info)
    }
}

// MARK: Public methods
extension DiceRollerTest {
    
    public func startRollFrequencyTest() {
        rollFrequencyTest()
    }
    
    public func startRollBoundsTest() {
        rollBoundsTest()
    }
    
    public func startRollRepeatTest() {
        rollRepeatTest()
    }
    
}
