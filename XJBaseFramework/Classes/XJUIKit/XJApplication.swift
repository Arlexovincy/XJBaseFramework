//
//  XJApplication.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/3/20.
//

import Foundation

public extension UIApplication {
    
    /// 获取KeyWindow
    var xj_keyWindows: UIWindow? {
        if #available(iOS 13.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            if #available(iOS 15.0, *) {
                return windowScene?.keyWindow
            } else {
                return windowScene?.windows.first
            }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
