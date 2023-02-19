//
//  XJDictionaryExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/18.
//

import Foundation

// MARK: - Methods
public extension Dictionary {
    
    /// 判断是否存在某个key
    ///
    ///     let dict: [String: Any] = ["testKey": "testValue", "testArrayKey": [1, 2, 3, 4, 5]]
    ///     dict.has(key: "testKey") -> true
    ///     dict.has(key: "anotherKey") -> false
    ///
    /// - Parameter key: key
    /// - Returns: 是：字典存在key， 否：字典不存在key
    func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    /// 移除某些（sequence）键值对
    ///
    ///     var dict : [String: String] = ["key1" : "value1", "key2" : "value2", "key3" : "value3"]
    ///     dict.removeAll(keys: ["key1", "key2"])
    ///     dict.keys.contains("key3") -> true
    ///     dict.keys.contains("key1") -> false
    ///     dict.keys.contains("key2") -> false
    ///
    /// - Parameter keys: keys（sequence）
    mutating func removeAll<S: Sequence>(keys: S) where S.Element == Key {
        keys.forEach { removeValue(forKey: $0) }
    }
    
    /// 字典转换成JSON格式的Data
    /// - Parameter prettify: 是否美化打印
    /// - Returns: JSON Data
    func jsonData(prettify: Bool = false) -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization
            .WritingOptions()
        return try? JSONSerialization.data(withJSONObject: self, options: options)
    }
    
    /// 字典转换成JSON格式的字符串
    ///     dict.jsonString() -> "{"testKey":"testValue","testArrayKey":[1,2,3,4,5]}"
    ///
    ///        dict.jsonString(prettify: true)
    ///        /*
    ///        returns the following string:
    ///
    ///        "{
    ///        "testKey" : "testValue",
    ///        "testArrayKey" : [
    ///            1,
    ///            2,
    ///            3,
    ///            4,
    ///            5
    ///        ]
    ///        }"
    /// - Parameter prettify: 是否美化打印
    /// - Returns: JSON格式的字符
    func jsonString(prettify: Bool = false) -> String? {
        guard JSONSerialization.isValidJSONObject(self) else { return nil }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization
            .WritingOptions()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: options) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
    
    /// 对字典里面的key和value做map操作映射
    ///
    ///     let intToString = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9"]
    ///     let stringToInt: [String: Int] = intToString.mapKeysAndValues { key, value in
    ///             return (String(describing: key), Int(value)!)
    
    ///             }
    ///     result： ["0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9]
    ///
    /// - Parameter transform: 操作
    /// - Returns: 操作映射后的字典
    func mapKeysAndValues<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)) rethrows -> [K: V] {
        return [K: V](uniqueKeysWithValues: try map(transform))
    }
    
    /// 遴选出一组key and value 生成新的字典
    /// - Parameter keys: keys
    /// - Returns: 新的字典
    func pick(keys: [Key]) -> [Key: Value] {
        keys.reduce(into: [Key: Value]()) { result, item in
            result[item] = self[item]
        }
    }
}

// MARK: - Operators
public extension Dictionary {
    
    /// 合并2个字典
    ///
    ///        let dict: [String: String] = ["key1": "value1"]
    ///        let dict2: [String: String] = ["key2": "value2"]
    ///        let result = dict + dict2
    ///        result["key1"] -> "value1"
    ///        result["key2"] -> "value2"
    ///
    /// - Parameters:
    ///   - lhs: 左边的字典
    ///   - rhs: 右边的字典
    /// - Returns: 合并后的字典
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        rhs.forEach { result[$0] = $1 }
        return result
    }
    
    /// 左边字典加上右边字典的所有健值对
    ///
    ///        var dict: [String: String] = ["key1": "value1"]
    ///        let dict2: [String: String] = ["key2": "value2"]
    ///        dict += dict2
    ///        dict["key1"] -> "value1"
    ///        dict["key2"] -> "value2"
    ///
    /// - Parameters:
    ///   - lhs: 左边字典
    ///   - rhs: 右边字典
    static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        rhs.forEach { lhs[$0] = $1 }
    }
    
    /// 生成一个新字典：左边字典移除右边sequence包含的key
    ///
    ///        let dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
    ///        let result = dict-["key1", "key2"]
    ///        result.keys.contains("key3") -> true
    ///        result.keys.contains("key1") -> false
    ///        result.keys.contains("key2") -> false
    ///
    /// - Parameters:
    ///   - lhs: 字典
    ///   - keys: sequence，包含keys
    /// - Returns: 移除keys后的字典
    static func - <S: Sequence>(lhs: [Key: Value], keys: S) -> [Key: Value] where S.Element == Key {
        var result = lhs
        result.removeAll(keys: keys)
        return result
    }
    
    /// 左边字典移除sequence包含的keys
    ///
    ///        var dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
    ///        dict-=["key1", "key2"]
    ///        dict.keys.contains("key3") -> true
    ///        dict.keys.contains("key1") -> false
    ///        dict.keys.contains("key2") -> false
    ///
    /// - Parameters:
    ///   - lhs: 左边字典
    ///   - keys: keys
    static func -= <S: Sequence>(lhs: inout [Key: Value], keys: S) where S.Element == Key {
        lhs.removeAll(keys: keys)
    }
}
