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
    
    /// 显示提示
    /// - Parameter tips: 提示信息
    func showTips(tips: String)
    
    /// 显示空数据图
    /// - Parameters:
    ///   - emptyView: 自定义的空数据图
    ///   - inView: 在哪个视图显示
    ///   - layoutEdgeInsert: 边距设置
    func showEmptyView(emptyView: XJEmptyStateView, inView: UIView, layoutEdgeInsert: UIEdgeInsets)
    
    /// 隐藏空数据视图
    /// - Parameter inView: 在哪个view上的
    func hideEmptyView(inView: UIView)
    
    /// 设置UI控件的字体大小
    func setupUIFontSize()
}

open class XJView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        /// 监听全局字体大小改变的通知
        NotificationCenter.default.addObserver(self, selector: #selector(globalFontSizeDidShifted), name: XJGlobalFontManager.globalFontSizeDidShiftedNotification, object: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// 全局字体大小已经发生改变了
    @objc private func globalFontSizeDidShifted() {
        setupUIFontSize()
    }
    
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
    
    /// 显示提示
    /// - Parameter tips: 提示信息
    public func showTips(tips: String) {
        XJHudProvider.showTips(withText: tips, inView: self)
    }
    
    /// 显示空数据图
    /// - Parameters:
    ///   - emptyView: 自定义的空数据图
    ///   - inView: 在哪个视图显示
    ///   - layoutEdgeInsert: 边距设置
    public func showEmptyView(emptyView: XJEmptyStateView, inView: UIView, layoutEdgeInsert: UIEdgeInsets = UIEdgeInsets.zero) {
        if emptyView.superview != nil {
            emptyView.removeFromSuperview()
        }
        
        inView.addSubview(emptyView)
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.topAnchor.constraint(equalTo: inView.topAnchor, constant: layoutEdgeInsert.top).isActive = true
        emptyView.bottomAnchor.constraint(equalTo: inView.bottomAnchor, constant: -layoutEdgeInsert.bottom).isActive = true
        emptyView.leftAnchor.constraint(equalTo: inView.leftAnchor, constant: layoutEdgeInsert.left).isActive = true
        emptyView.rightAnchor.constraint(equalTo: inView.rightAnchor, constant: -layoutEdgeInsert.right).isActive = true
        
    }
    
    /// 隐藏空数据视图
    /// - Parameter inView: 在哪个view上的
    public func hideEmptyView(inView: UIView) {
        for subView in inView.subviews {
            if subView.isKind(of: XJEmptyStateView.self) {
                subView.removeFromSuperview()
            }
        }
    }
    
    
    /// 设置UI控件的字体大小
    public func setupUIFontSize() {
        /// 交给子类去实现
    }
}
