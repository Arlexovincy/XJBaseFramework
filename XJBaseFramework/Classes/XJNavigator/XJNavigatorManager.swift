//
//  XJNavigator.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/23.
//

import Foundation
import URLNavigator

/// 在需要注册路由的地方统一实现该协议，在该协议的方法上进行统一注册
public protocol XJNavigatorRegisterProtocol {
    /// 注册路由和事件
    static func registerRouterAndEvent()
}

public class XJNavigatorManager {
    
    /// 单例
    public static let share = XJNavigatorManager()
    
    /// 全局用于路由的navgator对象
    fileprivate let navigator = Navigator()
    
    /// 开始使用路由功能
    public func startNavigator() {
        let expectedClassCount = objc_getClassList(nil, 0)
        let allClasses = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(expectedClassCount))
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
        let actualClassCount: Int32 = objc_getClassList(autoreleasingAllClasses, expectedClassCount)
        
        for i in 0..<actualClassCount {
            let currentClass: AnyClass = allClasses[Int(i)]
            if let cls = currentClass as? XJNavigatorRegisterProtocol.Type {
                cls.registerRouterAndEvent()
            }
        }
    }
    
    /// 注册一个UIViewController的路由地址
    /// - Parameters:
    ///   - _url: 路由地址
    ///   - factory: 生成UIViewController的闭包
    public func register(_ url: String, _ factory: @escaping ViewControllerFactory) {
        navigator.register(url, factory)
    }
    
    /// 注册事件处理路由
    /// - Parameters:
    ///   - url: 路由地址
    ///   - factory: 生成事件的闭包
    func registerHandleEvent(_ url: String, _ factory: @escaping URLOpenHandlerFactory) {
        navigator.handle(url, factory)
    }
    
    @discardableResult
    
    /// push一个UIViewController
    /// - Parameters:
    ///   - url: 路由的地址
    ///   - context: 参数传递
    ///   - animated: 是否动画
    /// - Returns: 被push的UIViewController
    func push(_ url: URLConvertible, context: Any? = nil, animated: Bool = true) -> UIViewController? {
        return navigator.push(url, context: context, animated: animated)
    }
    
    @discardableResult
    
    /// present一个UIViewController
    /// - Parameters:
    ///   - url: 路由地址
    ///   - context: 参数传递
    ///   - animated: 是否动画
    ///   - completion: 完成后的回调
    /// - Returns: 被present的UIViewController
    func present(_ url: URLConvertible, context: Any? = nil, animated: Bool = true, completion: (() -> Void)? = nil) -> UIViewController? {
        return navigator.present(url,context: context, animated: animated, completion: completion)
    }
    
    @discardableResult
    
    /// 执行注册过的事件（registerHandleEvent）
    /// - Parameters:
    ///   - url: 路由的地址
    ///   - context: 参数传递
    /// - Returns: 是否执行成功
    func executeEvent(_ url: URLConvertible, context: Any? = nil) -> Bool {
        return navigator.open(url, context: context)
    }
}
