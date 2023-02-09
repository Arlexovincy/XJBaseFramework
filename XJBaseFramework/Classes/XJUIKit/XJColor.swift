//
//  XJColor.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/8.
//

import UIKit
import UIColor_Hex_Swift

public class XJColor {
    
    /// 使用hex值来生成UIColor
    /// - Parameter hex: hex值 如："#FFCC00" ; 8 character representation (with alpha)
    /// - Returns: 颜色
    public static func color(hex: String) -> UIColor {
        let color = UIColor(hex)
        return color
    }
    
    /// 使用hex值来生成CGColor
    /// - Parameter hex: hex值 如："#FFCC00" ; 8 character representation (with alpha)
    /// - Returns: 颜色（CGColor）
    public static func cgColor(hex: String) -> CGColor {
        let cgColor = XJColor.color(hex: hex).cgColor
        return cgColor
    }
}
