//
//  DebugConsoleView.swift
//  cancase
//
//  Created by Can Babaoğlu on 22.10.2023.
//

import UIKit

final class DebugConsoleView: UIView {
    
    private var textView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        textView = UITextView(frame: self.bounds)
        textView.textColor = .white
        textView.backgroundColor = .clear
        textView.isEditable = false
        addSubview(textView)
    }

}

//MARK: ~ Public methods
extension DebugConsoleView {
    public func addLog(_ message: String) {
        textView.text.append("\(message)\n")
        let range = NSRange(location: textView.text.count - 1, length: 1)
        textView.scrollRangeToVisible(range)
    }
    
}
