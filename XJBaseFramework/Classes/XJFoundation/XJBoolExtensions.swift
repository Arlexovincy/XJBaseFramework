//
//  XJBoolExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/17.
//

import Foundation

public extension Bool {
    
    /// 用整型来表示bool类型
    ///     false.int -> 0
    ///     true.int -> 1
    var int: Int {
        return self ? 1 : 0
    }
    
    /// 用字符串来表示bool类型
    ///     false.string -> "false"
    ///     true.string -> "true"
    var string: String {
        return self ? "true" : "false"
    }
}
