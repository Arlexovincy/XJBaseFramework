//
//  XJFloatingPointExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/18.
//

import Foundation

/// 对于FloatingPoint的解释，以下是官方文档描述
/// Floating-point types are used to represent fractional numbers, like 5.5, 100.0, or 3.14159274. Each floating-point type has its own possible range and precision. The floating-point types in the standard library are Float, Double, and Float80 where available.

// MARK: - Properties
public extension FloatingPoint {
    
    /// 取绝对值
    var abs: Self {
        return Swift.abs(self)
    }
    
    /// 判读是否大于0
    var isPositive: Bool {
        return self > 0
    }
    
    /// 判断是否小于0
    var isNegative: Bool {
        return self < 0
    }
    
    /// 向上取整
    var ceil: Self {
        return Foundation.ceil(self)
    }
    
    /// 向下取整
    var floor: Self {
        return Foundation.floor(self)
    }
}
