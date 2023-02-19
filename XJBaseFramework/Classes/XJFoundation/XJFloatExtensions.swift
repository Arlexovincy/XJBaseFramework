//
//  XJFloatExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/18.
//

import Foundation

// MARK: - Properties
public extension Float {
    
    /// 用Int表示
    var int: Int {
        return Int(self)
    }
    
    /// 用double表示
    var double: Double {
        return Double(self)
    }
    
    /// 用CGFloat表示
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
