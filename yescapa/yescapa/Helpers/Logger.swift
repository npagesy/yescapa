//
//  Logger.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 22/02/2022.
//

import Foundation

public enum LogLevel {
    case debug
    case error
    case info
}

public class Logger {
    public static func log(level: LogLevel = .debug, _ message: Any) {
        switch level {
        case .debug: print("😱 \(message)")
        case .error: print("❌ \(message)")
        case .info: print("❕ \(message)")
        }
    }
}
