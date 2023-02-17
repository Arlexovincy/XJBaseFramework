//
//  XJLogDefine.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/16.
//

import Foundation
import CocoaLumberjack

// 日志打印等级
public let XJDefaultLogLevel: DDLogLevel = .all

fileprivate func _XJLog(_ message: String,
                       level: DDLogLevel = XJDefaultLogLevel,
                       flag: DDLogFlag,
                       context: Int = 0,
                       file: StaticString = #file,
                       function: StaticString = #function,
                       line: UInt = #line,
                       tag: Any? = nil,
                       asynchronous async: Bool = false,
                       ddlog: DDLog = .sharedInstance) {
    
    _DDLogMessage(message, level: level, flag: flag, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
}

/// Default flag is verbose
public func XJLog(_ message: String = "-",
                 level: DDLogLevel = XJDefaultLogLevel,
                 context: Int = 0,
                 file: StaticString = #file,
                 function: StaticString = #function,
                 line: UInt = #line,
                 tag: Any? = nil,
                 asynchronous async: Bool = false,
                 ddlog: DDLog = .sharedInstance) {
    _XJLog(message, level: level, flag: .verbose, context: context, file: file, function: function, line: line, tag: "none", asynchronous: async, ddlog: ddlog)
}

/// Verbose
public func XJLog_v(_ verbose: String = "-",
                   level: DDLogLevel = XJDefaultLogLevel,
                   context: Int = 0,
                   file: StaticString = #file,
                   function: StaticString = #function,
                   line: UInt = #line,
                   tag: Any? = nil,
                   asynchronous async: Bool = false,
                   ddlog: DDLog = .sharedInstance) {
    _XJLog(verbose, level: level, flag: .verbose, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
}

/// Debug
public func XJLog_d(_ debug: String = "-",
                   level: DDLogLevel = XJDefaultLogLevel,
                   context: Int = 0,
                   file: StaticString = #file,
                   function: StaticString = #function,
                   line: UInt = #line,
                   tag: Any? = nil,
                   asynchronous async: Bool = false,
                   ddlog: DDLog = .sharedInstance) {
    _XJLog(debug, level: level, flag: .debug, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
}

/// Info
public func XJLog_i(_ info: String = "-",
                   level: DDLogLevel = XJDefaultLogLevel,
                   context: Int = 0,
                   file: StaticString = #file,
                   function: StaticString = #function,
                   line: UInt = #line,
                   tag: Any? = nil,
                   asynchronous async: Bool = false,
                   ddlog: DDLog = .sharedInstance) {
    _XJLog(info, level: level, flag: .info, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
}

/// Warning
public func XJLog_w(_ warning: String = "-",
                   level: DDLogLevel = XJDefaultLogLevel,
                   context: Int = 0,
                   file: StaticString = #file,
                   function: StaticString = #function,
                   line: UInt = #line,
                   tag: Any? = nil,
                   asynchronous async: Bool = false,
                   ddlog: DDLog = .sharedInstance) {
    _XJLog(warning, level: level, flag: .warning, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
}

/// Error
public func XJLog_e(_ error: String = "-",
                   level: DDLogLevel = XJDefaultLogLevel,
                   context: Int = 0,
                   file: StaticString = #file,
                   function: StaticString = #function,
                   line: UInt = #line,
                   tag: Any? = nil,
                   asynchronous async: Bool = false,
                   ddlog: DDLog = .sharedInstance) {
    _XJLog(error, level: level, flag: .error, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
}
