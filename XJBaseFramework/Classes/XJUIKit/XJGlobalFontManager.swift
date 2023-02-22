//
//  XJGlobalFontManager.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/22.
//

import Foundation

/// 管理全局字体大小等
public class XJGlobalFontManager {
    /// 单例
    static public let share = XJGlobalFontManager()
    
    /// 全局字体大小发生偏移的通知
    static let globalFontSizeDidShiftedNotification:Notification.Name = Notification.Name.globalFontSizeDidShifted
    
    /// 字体当前偏移量存取key
    fileprivate static let fontShiftingKey = "fontShiftingKey"
    
    /// 当前字体偏移量
    private(set) var currentShiftingValue: Float = getFontShiftingValue()
    
    /// 字体大小偏移
    /// - Parameter stepSize: 偏移的大小
    func fontShifting(with stepSize: Float) {
        currentShiftingValue = currentShiftingValue + stepSize
        XJGlobalFontManager.saveFontShifting(value: currentShiftingValue)
        NotificationCenter.default.post(name: XJGlobalFontManager.globalFontSizeDidShiftedNotification, object: nil)
    }
}

// MARK: - 处理偏移量的存取
fileprivate extension XJGlobalFontManager {
    
    /// 获取当前字体需要的偏移量
    /// - Returns: 字体偏移量
    static func getFontShiftingValue() -> Float {
        let shiftingValue = UserDefaults.standard.float(forKey: fontShiftingKey)
        return shiftingValue
    }
    
    /// 保持当前字体偏移量
    /// - Parameter value: 字体偏移量
    static func saveFontShifting(value: Float) {
        UserDefaults.standard.setValue(value, forKey: fontShiftingKey)
        UserDefaults.standard.synchronize()
    }
}
