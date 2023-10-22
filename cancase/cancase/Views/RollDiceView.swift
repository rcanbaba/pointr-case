//
//  RollDiceView.swift
//  cancase
//
//  Created by Can Babaoğlu on 22.10.2023.
//

import UIKit

protocol RollDiceViewDelegate: AnyObject {
    func rollDiceButtonTapped(view: UIView)
}

class RollDiceView: UIView {
    
    public weak var delegate: RollDiceViewDelegate?
    
    private let diceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.text = "Roll the dice!"
        return label
    }()
    
    private let rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.addTarget(self, action: #selector(rollDiceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        diceLabel.translatesAutoresizingMaskIntoConstraints = false
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(diceLabel)
        addSubview(rollButton)
        
        NSLayoutConstraint.activate([
            diceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            diceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            rollButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            rollButton.topAnchor.constraint(equalTo: diceLabel.bottomAnchor, constant: 20)
        ])
    }
    
}

// MARK: - Actions
extension RollDiceView {
    @objc private func rollDiceButtonTapped() {
        delegate?.rollDiceButtonTapped(view: self)
    }
}


// MARK: - Public Methods
extension RollDiceView {
    public func set(diceLabelText: String) {
        diceLabel.text = diceLabelText
    }
}
