//
//  XJLogApi.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/16.
//

import Foundation

/// 强烈建议使用以下方法作为输出

/// 默认输出（verbose）
public func XJ_ALog(_ message: String = "-",
             file: StaticString = #file,
             function: StaticString = #function,
             line: UInt = #line) {
    XJLog(message, file: file, function: function,line: line)
}

/// verbose 输出
public func XJ_VLog(_ message: String = "-",
                 file: StaticString = #file,
                 function: StaticString = #function,
                 line: UInt = #line) {
    XJLog_v(message, file: file, function: function, line: line)
}

/// debug 输出
public func XJ_DLog(_ message: String = "-",
                 file: StaticString = #file,
                 function: StaticString = #function,
                 line: UInt = #line) {
    XJLog_d(message, file: file, function: function, line: line)
}

/// info 输出
public func XJ_ILog(_ message: String = "-",
                 file: StaticString = #file,
                 function: StaticString = #function,
                 line: UInt = #line) {
    XJLog_i(message, file: file, function: function, line: line)
}

/// warning 输出
public func XJ_WLog(_ message: String = "-",
                 file: StaticString = #file,
                 function: StaticString = #function,
                 line: UInt = #line) {
    XJLog_w(message, file: file, function: function, line: line)
}

/// error 输出
public func XJ_ELog(_ message: String = "-",
                 file: StaticString = #file,
                 function: StaticString = #function,
                 line: UInt = #line) {
    XJLog_e(message, file: file, function: function, line: line)
}
