//
//  XJLogFormatter.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/16.
//

import Foundation
import CocoaLumberjack

enum XJLogFlag: String {
    case verbose    = "verbose" // 详细
    case debug      = "debug" // 调试
    case info       = "info" // 信息
    case warning    = "warning" // 警告
    case error      = "error" // 错误
    case none       = "none" // 无
    
    public var flag: String {
        switch self {
        case .verbose:
            return "🔎"
        case .debug:
            return "🔧"
        case .info:
            return "📰"
        case .warning:
            return "⚠️"
        case .error:
            return "🚫"
        case .none:
            return "🈚️"
        }
    }
    
    /// 生成简易标志
    /// - Parameter log: log
    /// - Returns: XJLog标志
    public static func flag(_ log: DDLogMessage) -> XJLogFlag {
        if let tag = log.representedObject as? String, tag == "none" {
            return XJLogFlag.none
        }
        
        let flag = log.flag
        
        switch flag {
        case DDLogFlag.verbose:
            return XJLogFlag.verbose
        case DDLogFlag.debug:
            return XJLogFlag.debug
        case DDLogFlag.info:
            return XJLogFlag.info
        case DDLogFlag.warning:
            return XJLogFlag.warning
        case DDLogFlag.error:
            return XJLogFlag.error
        default:
            return XJLogFlag.none
        }
        
    }
    
    
    /// 时间格式
    /// - Parameter date: 日期
    /// - Returns: 格式化后的时间
    static fileprivate func dateToLocalStr(_ date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.string(from: date)
    }
    
    
    /// 简化方法名称
    /// - Parameter funcStr: 方法名称
    /// - Returns: 简化后的方法名称
    static fileprivate func funcCut(_ funcStr: String?) -> String {
        
        guard let funcStr = funcStr else {
            return "-"
        }
        
        guard let range = funcStr.range(of: "(") else {
            return funcStr
        }
        
        return String(funcStr[funcStr.startIndex ..< range.lowerBound])
    }
}

class XJLogFormatter: NSObject, DDLogFormatter {
    
    /// 日志格式
    /// - Parameter logMessage: 日志信息
    /// - Returns: 格式化后的日志
    func format(message logMessage: DDLogMessage) -> String? {
        let funcStr = XJLogFlag.funcCut(logMessage.function)
        return "\(XJLogFlag.flag(logMessage).flag)(\(XJLogFlag.flag(logMessage).rawValue))[\(logMessage.fileName) \(funcStr) line:\(logMessage.line)]:\(logMessage.message)"
    }
}

class XJFileLogFormatter: NSObject, DDLogFormatter {
    
    /// 日志格式
    /// - Parameter logMessage: 日志信息
    /// - Returns: 格式化后的日志
    func format(message logMessage: DDLogMessage) -> String? {
        let dateStr = XJLogFlag.dateToLocalStr(logMessage.timestamp)
        let funcStr = XJLogFlag.funcCut(logMessage.function)
        return "\(XJLogFlag.flag(logMessage).flag)(\(XJLogFlag.flag(logMessage).rawValue))[\(logMessage.fileName) \(funcStr) line:\(logMessage.line) dateTimes:\(dateStr)]:\(logMessage.message)"
    }
    
    
}
