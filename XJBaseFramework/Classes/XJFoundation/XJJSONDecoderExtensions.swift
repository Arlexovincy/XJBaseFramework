//
//  XJJSONDecoderExtensions.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/3/25.
//

import Foundation

public extension JSONDecoder {
    
    /// json对象转model
    /// - Parameters:
    ///   - type: 类型
    ///   - data: json对象
    /// - Returns: model对象
    func xj_decode<T>(_ type: T.Type, from data: Any) throws -> T where T: Decodable {
        if let jsonData = try? JSONSerialization.data(withJSONObject: data) {
            return try decode(type, from: jsonData)
        } else {
            throw NSError(domain: "data转数据类型失败", code: -999)
        }
    }
}
