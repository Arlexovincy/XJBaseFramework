//
//  XJUINavigationBarExtensions.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/23.
//

import UIKit

// MARK: - Methods

public extension UINavigationBar {
    
    /// 设置navigationBar的字体和颜色
    /// - Parameters:
    ///   - font: 字体
    ///   - color: 颜色
    func setTitleFont(_ font: UIFont, color: UIColor = .black) {
        var attrs = [NSAttributedString.Key: Any]()
        attrs[.font] = font
        attrs[.foregroundColor] = color
        titleTextAttributes = attrs
    }
    
    /// 让navigationBar变透明
    /// - Parameter tint: tint color
    func makeTransparent(withTint tint: UIColor = .white) {
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        tintColor = tint
        titleTextAttributes = [.foregroundColor: tint]
        shadowImage = UIImage()
    }
    
    /// 设置navigationBar的背景颜色和文字颜色
    /// - Parameters:
    ///   - background: 背景颜色
    ///   - text: 文字颜色
    func setColors(background: UIColor, text: UIColor) {
        isTranslucent = false
        backgroundColor = background
        barTintColor = background
        setBackgroundImage(UIImage(), for: .default)
        tintColor = text
        titleTextAttributes = [.foregroundColor: text]
    }
}
