//
//  XJHUDProvider.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/10.
//

import Foundation
import MBProgressHUD

public class XJHudProvider {
    
    
    /// 显示加载中的指示器
    /// - Parameters:
    ///   - text: 加载中的文案,默认是：XJUIKitConfigure.XJHud.loadingText
    ///   - view: 在哪个视图上显示
    public static func showLoading(withText text: String? = XJUIKitConfigure.XJHud.loadingText, inView view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.label.text = text
    }
    
    /// 隐藏HUD
    /// - Parameter view: 在哪个视图上隐藏
    public static func hideLoading(inView view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    /// 显示提示信息
    /// - Parameters:
    ///   - text: 提示文案
    ///   - view: 在哪个视图上显示
    public static func showTips(withText text:String?, inView view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.hide(animated: true, afterDelay: XJUIKitConfigure.XJHud.delayHideSecond)
    }
}
