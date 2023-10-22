//
//  ViewController.swift
//  cancase
//
//  Created by Can Babaoğlu on 22.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            DebugConsoleManager.shared.log("This is a test message")
        }
    }


}

