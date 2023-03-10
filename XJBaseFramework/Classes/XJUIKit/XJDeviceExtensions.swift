//
//  XJDeviceExtensions.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/28.
//

import Foundation

public extension UIDevice {
    
    /// 底部安全区域距离
    /// - Returns: 底部安全区域距离
    static func safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            if let window = windowScene?.windows.first {
                return window.safeAreaInsets.bottom
            } else {
                return 0
            }
        } else if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.windows.first {
                return window.safeAreaInsets.bottom
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    /// 获取顶部安全区域距离
    /// - Returns: 顶部安全区域距离
    static func safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            if let window = windowScene?.windows.first {
                return window.safeAreaInsets.top
            } else {
                return 0
            }
        } else if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.windows.first {
                return window.safeAreaInsets.top
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    /// 获取屏幕宽度
    /// - Returns: 屏幕宽度
    static func screenWidth() -> CGFloat {
        let width = UIScreen.main.bounds.width
        return width
    }
    
    /// 获取屏幕高度 
    /// - Returns: 屏幕高度
    static func screenHeight() -> CGFloat {
        let height = UIScreen.main.bounds.height
        return height
    }
    
    /// 获取tabBar的高度
    /// - Returns: tabBar的高度
    static func tabBarHeight() -> CGFloat {
        return 49.0
    }
    
    /// 获取App的版本号
    /// - Returns: app版本号
    static func getAppVersion() -> String {
        let info = Bundle.main.infoDictionary
        let appVersion = info?["CFBundleShortVersionString"] as? String ?? "Unknown"
        return appVersion
    }
}
