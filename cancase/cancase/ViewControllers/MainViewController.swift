//
//  MainViewController.swift
//  cancase
//
//  Created by Can Babaoğlu on 22.10.2023.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var rollDiceView = RollDiceView()
    
    private var diceRoller: DiceRoller?
    private var diceRollerTest: DiceRollerTest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        DebugConsoleManager.shared.log(["MainViewController viewDidLoad"], userLogLevel: .info)
        diceRoller = DiceRoller()
        diceRollerTest = DiceRollerTest(diceRoller: diceRoller!)
        configureUI()
    }

    private func configureUI() {
        setupRollDiceView()
        rollDiceView.delegate = self
        
    }
    
    private func setupRollDiceView() {
        rollDiceView.translatesAutoresizingMaskIntoConstraints = false
        rollDiceView.layer.borderColor = UIColor.black.cgColor
        rollDiceView.layer.borderWidth = 1.0
        view.addSubview(rollDiceView)
        
        NSLayoutConstraint.activate([
            rollDiceView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            rollDiceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollDiceView.widthAnchor.constraint(equalTo: view.widthAnchor),
            rollDiceView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}

extension MainViewController: RollDiceViewDelegate {
    func rollDiceButtonTapped(view: UIView) {
        guard let diceRoller = diceRoller else {
            DebugConsoleManager.shared.log(["diceRoller nil"], userLogLevel: .fatal)
            return
        }
        rollDiceView.set(diceLabelText: "\(diceRoller.roll())")
    }
    
    func rollFrequencyTestButtonTapped(view: UIView) {
        guard let diceRollerTest = diceRollerTest  else {
            DebugConsoleManager.shared.log(["diceRollerTest nil"], userLogLevel: .fatal)
            return
        }
        DebugConsoleManager.shared.log(["diceRollerTest frequency started"], userLogLevel: .info)
        diceRollerTest.rollFrequencyTest()
    }
    
    func rollBoundsTestButtonTapped(view: UIView) {
        guard let diceRollerTest = diceRollerTest  else {
            DebugConsoleManager.shared.log(["diceRollerTest nil"], userLogLevel: .fatal)
            return
        }
        DebugConsoleManager.shared.log(["diceRollerTest bounds started"], userLogLevel: .info)
        diceRollerTest.rollBoundsTest()
    }
    
    func rollRepeatTestButtonTapped(view: UIView) {
        guard let diceRollerTest = diceRollerTest  else {
            DebugConsoleManager.shared.log(["diceRollerTest nil"], userLogLevel: .fatal)
            return
        }
        DebugConsoleManager.shared.log(["diceRollerTest repeat started"], userLogLevel: .info)
        diceRollerTest.rollRepeatTest()
    }
    
    
}
