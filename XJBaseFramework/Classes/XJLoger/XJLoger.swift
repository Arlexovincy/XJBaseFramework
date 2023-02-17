//
//  XJLoger.swift
//  CocoaLumberjack
//
//  Created by 黎锡坚 on 2023/2/16.
//

import Foundation
import CocoaLumberjack

public class XJLoger {
    
    /// 单例
    public static let shared = XJLoger()
    
    /// 摇一摇显示日志
    var isShakeLogerViewShow = false
    
    private var fileLogger: DDFileLogger?
    
    
    /// 开启日志功能
    /// - Parameter config: 配置信息
    public func start(_ config: XJLogConfig = XJLogConfig()) {
        let format = XJLogFormatter()
        DDOSLogger.sharedInstance.logFormatter = format
        DDLog.add(DDOSLogger.sharedInstance)
        
        fileLogger = generateFileLogger(filePath: config.logFilesPath)
        if let fileLG = fileLogger {
            // 重用log文件，不要每次启动都创建新的log文件(默认值是NO)
            fileLG.doNotReuseLogFiles = false
            // log文件在24小时内有效，超过时间创建新log文件(默认值是24小时)
            fileLG.rollingFrequency = config.rollingFrequency
            // 为0时禁用文件大小滚动
            fileLG.maximumFileSize = config.maximumFileRollSize
            // 最多保存几个文件
            fileLG.logFileManager.maximumNumberOfLogFiles = config.maximumNumberOfLogFiles
            // log文件占用最大的空间
            fileLG.logFileManager.logFilesDiskQuota = config.maximumFileSize
            
            DDLog.add(fileLG)
        }
    }
    
    
    /// 显示log视图
    /// - Parameter inView: 在哪里显示
    public func showLogView(_ inView: UIView? = nil) {
        
    }
    
    /// 生成文件日志器
    /// - Parameter filePath: 文件路径
    /// - Returns: 文件日志器
    private func generateFileLogger(filePath: String) -> DDFileLogger {
        if FileManager.default.fileExists(atPath: filePath) == false {
            try? FileManager.default.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)
        }
        let manager = DDLogFileManagerDefault(logsDirectory: filePath)
        let fileLogger = DDFileLogger.init(logFileManager: manager)
        fileLogger.logFormatter = XJFileLogFormatter()
        return fileLogger
    }
}

public class XJLogConfig {
    public init() {}
    
    /// 文件大小滚动，为0时候禁用
    public var maximumFileRollSize: UInt64 = 0
    
    /// 缓存几个文件
    public var maximumNumberOfLogFiles: UInt = 7
    
    /// 每个文件大小
    public var maximumFileSize: UInt64 = 1024*1024*20
    
    /// log文件在24小时（默认）内有效,超过时间创建新的log文件
    public var rollingFrequency: TimeInterval = 60*60*24
    
    /// 日志路径
    public var logFilesPath: String = "\(NSHomeDirectory())/Library/Preferences/Logs"
}
