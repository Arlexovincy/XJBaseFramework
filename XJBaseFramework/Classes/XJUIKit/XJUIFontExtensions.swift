//
//  XJUIFontExtensions.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/22.
//

import Foundation

public extension UIFont {
    
    /// 使用系统字体，并且会自动增加全局的字体偏移量作为字体大小
    /// - Parameter fontSize: 原始的字体大小
    /// - Returns: 增加偏移量后的字体对象
    static func systemFontAutoShifting(ofSize fontSize: Float) -> UIFont {
        let fSize = fontSize + XJGlobalFontManager.share.currentShiftingValue
        return UIFont.systemFont(ofSize: CGFloat(fSize))
    }
    
    /// 使用系统粗体字体，并且会自动增加全局的字体偏移量作为字体大小
    /// - Parameter fontSize: 原始字体大小
    /// - Returns: 增加偏移量后的粗体字体对象
    static func boldSystemFontAutoShifting(ofSize fontSize: Float) -> UIFont {
        let fSize = fontSize + XJGlobalFontManager.share.currentShiftingValue
        return UIFont.boldSystemFont(ofSize: CGFloat(fSize))
    }
}
