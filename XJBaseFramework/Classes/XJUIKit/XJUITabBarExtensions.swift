//
//  XJUITabBarItemExtensions.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/23.
//

import Foundation

public extension UITabBar {
    
    /// 设置tabBarItem的富文本属性
    /// - Parameters:
    ///   - fSize: 字体大小
    ///   - nClolor: 正常情况下的颜色
    ///   - sColor: 选中情况下的颜色
    ///   - bgColor: 背景颜色
    func setItemAttributes(fontSize fSize: Float,normalColor nClolor: UIColor, selectedColor sColor: UIColor, backgroundColor bgColor: UIColor) {
        
        // tabBarItem 文字大小
        var attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFontAutoShifting(ofSize: fSize)]
        
        // tabBarItem 文字默认颜色
        attributes[.foregroundColor] = nClolor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        
        // tabBarItem 文字选中颜色
        attributes[.foregroundColor] = sColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
        
        tintColor = sColor
        barTintColor = bgColor
        
        /// iOS 15 tabBar透明兼容
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 0.9)
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 0.9)
            
        }
    }
}

