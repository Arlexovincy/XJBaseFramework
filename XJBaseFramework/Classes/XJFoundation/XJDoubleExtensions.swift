//
//  XJDoubleExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/18.
//

import Foundation

// MARK: - Properties
public extension Double {
    
    /// 用Int类型表示
    var int: Int {
        return Int(self)
    }
    
    /// 用Float类型表示
    var float: Float {
        return Float(self)
    }
    
    /// 用CGFloat类型表示
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
