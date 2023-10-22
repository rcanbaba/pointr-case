//
//  DebugConsoleManager.swift
//  cancase
//
//  Created by Can Babaoğlu on 22.10.2023.
//

import UIKit

final class DebugConsoleManager {
    
    static let shared = DebugConsoleManager()
    
    private var consoleView: DebugConsoleView?
    
    private init() {}
    
    enum LogLevel: Int {
        case verbose
        case debug
        case info
        case warning
        case error
        case fatal
    }
    
    private let defaultLogLevel: LogLevel = .verbose
    
    private func log(_ items: [Any], userLogLevel: LogLevel) {
        
        if userLogLevel.rawValue >= defaultLogLevel.rawValue {
            let logIdentifier = getColoredEmoji(userLogLevel)
            let delimiter = ":"
            var finalLogMessage = "\(logIdentifier)\(delimiter)"
            for item in items {
                finalLogMessage += " \(String.init(describing: item))"
            }
            print(finalLogMessage)
            logToConsole(finalLogMessage)
        }
    }
    
    private func getColoredEmoji(_ logLevel: LogLevel) -> String {
        switch logLevel {
        case .verbose:
            return "💜"
        case .debug:
            return "💚"
        case .info:
            return "💙"
        case .warning:
            return "💛"
        case .error:
            return "❤️"
        case .fatal:
            return "💔💔💔"
        }
    }
    
    private func logToConsole(_ message: String) {
        consoleView?.addLog(message)
    }
}

//MARK: ~ Public methods
extension DebugConsoleManager {
    public func setupConsole(in window: UIWindow) {
        let height: CGFloat = 200.0
        let frame = CGRect(x: 0, y: window.bounds.height - height, width: window.bounds.width, height: height)
        consoleView = DebugConsoleView(frame: frame)
        window.addSubview(consoleView!)
    }
    

    
}
