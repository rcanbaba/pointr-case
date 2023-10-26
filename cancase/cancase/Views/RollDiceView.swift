//
//  RollDiceView.swift
//  cancase
//
//  Created by Can Babaoğlu on 22.10.2023.
//

import UIKit

protocol RollDiceViewDelegate: AnyObject {
    func rollDiceButtonTapped(view: UIView)
    func rollFrequencyTestButtonTapped(view: UIView)
    func rollBoundsTestButtonTapped(view: UIView)
    func rollRepeatTestButtonTapped(view: UIView)
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
    
    private let frequencyTest: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Frequency Test", for: .normal)
        button.addTarget(self, action: #selector(rollFrequencyTestButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    private let boundsTest: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Bounds Test", for: .normal)
        button.addTarget(self, action: #selector(rollBoundsTestButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let repeatTest: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Repeat Test", for: .normal)
        button.addTarget(self, action: #selector(rollRepeatTestButtonTapped), for: .touchUpInside)
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
        frequencyTest.translatesAutoresizingMaskIntoConstraints = false
        boundsTest.translatesAutoresizingMaskIntoConstraints = false
        repeatTest.translatesAutoresizingMaskIntoConstraints = false


        let testButtonsStackView = UIStackView(arrangedSubviews: [frequencyTest, boundsTest, repeatTest])
        testButtonsStackView.axis = .horizontal
        testButtonsStackView.spacing = 8
        testButtonsStackView.alignment = .fill
        testButtonsStackView.translatesAutoresizingMaskIntoConstraints = false

        
        let mainStackView = UIStackView(arrangedSubviews: [diceLabel, rollButton, testButtonsStackView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 16
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    
}

// MARK: - Actions
extension RollDiceView {
    @objc private func rollDiceButtonTapped() {
        delegate?.rollDiceButtonTapped(view: self)
    }
    @objc private func rollFrequencyTestButtonTapped() {
        delegate?.rollFrequencyTestButtonTapped(view: self)
    }
    @objc private func rollBoundsTestButtonTapped() {
        delegate?.rollBoundsTestButtonTapped(view: self)
    }
    @objc private func rollRepeatTestButtonTapped() {
        delegate?.rollRepeatTestButtonTapped(view: self)
    }
}


// MARK: - Public Methods
extension RollDiceView {
    public func set(diceLabelText: String) {
        diceLabel.text = diceLabelText
    }
}
