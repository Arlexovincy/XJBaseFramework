//
//  XJView.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/10.
//

import UIKit

public protocol XJViewProtocol: NSObject {
    
    /// 显示加载中
    func showLoading()
    
    /// 隐藏加载中
    func hideLoading()
}

open class XJView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension XJView: XJViewProtocol {
    
    /// 显示加载中
    public func showLoading() {
        XJHudProvider.showLoading(inView: self)
    }
    
    /// 隐藏加载中
    public func hideLoading() {
        XJHudProvider.hideLoading(inView: self)
    }
    
    
}
