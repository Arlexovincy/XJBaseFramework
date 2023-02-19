//
//  XJIntExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/18.
//

import Foundation

// MARK: - Properties

public extension Int {
    
    /// 用UInt表示
    var uInt: UInt {
        return UInt(self)
    }
    
    /// 用double表示
    var double: Double {
        return Double(self)
    }
    
    /// 用float表示
    var float: Float {
        return Float(self)
    }
    
    /// 用CGFloat表示
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
