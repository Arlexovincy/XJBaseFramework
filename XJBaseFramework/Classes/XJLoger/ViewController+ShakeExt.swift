//
//  ViewController+ShakeExt.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/16.
//

import UIKit

extension UIViewController {
    /// 开始摇晃
    open override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    /// 终止摇晃
    open override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    /// 结束摇晃
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if XJLoger.shared.isShakeLogerViewShow {
            XJLoger.shared.showLogView()
        }
    }
}
