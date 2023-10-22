//
//  MainViewController.swift
//  cancase
//
//  Created by Can Babaoğlu on 22.10.2023.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var rollDiceView = RollDiceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        configureUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            DebugConsoleManager.shared.log("This is a test message")
        }
    }

    private func configureUI() {
        setupRollDiceView()
        rollDiceView.delegate = self
        
    }
    
    private func setupRollDiceView() {
        rollDiceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rollDiceView)
        
        NSLayoutConstraint.activate([
            rollDiceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollDiceView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rollDiceView.widthAnchor.constraint(equalToConstant: 250),
            rollDiceView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func rollDice() -> Int {
        let timeInterval = Date().timeIntervalSince1970
        let milliseconds = Int(timeInterval * 1000)
        return milliseconds % 6 + 1
    }

}

extension MainViewController: RollDiceViewDelegate {
    func rollDiceButtonTapped(view: UIView) {
        DebugConsoleManager.shared.log("💙 rollDiceButtonTapped")
        
        rollDiceView.set(diceLabelText: "\(rollDice())")
    }
    
    
}
