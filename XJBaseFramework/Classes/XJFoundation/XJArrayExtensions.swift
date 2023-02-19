//
//  XJArrayExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/17.
//

import Foundation

// MARK: - Methods
public extension Array {
    
    /// 在数组的最前面插入一个元素
    ///
    ///         [2, 3, 4, 5].prepend(1) -> [1, 2, 3, 4, 5]
    ///         ["e", "l", "l", "o"].prepend("h") -> ["h", "e", "l", "l", "o"]
    ///         
    /// - Parameter newElement: 被插入的元素
    mutating func preAppend(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
    /// 数组交换元素
    ///
    ///         [1, 2, 3, 4, 5].safeSwap(from: 3, to: 0) -> [4, 2, 3, 1, 5]
    ///         ["h", "e", "l", "l", "o"].safeSwap(from: 1, to: 0) -> ["e", "h", "l", "l", "o"]
    ///
    /// - Parameters:
    ///   - index: 交换的第一个元素
    ///   - otherIndex: 交换的另一个元素
    mutating func safeSwap(from index: Index, to otherIndex: Index) {
        guard index != otherIndex else { return }
        guard startIndex..<endIndex ~= index else { return }
        guard startIndex..<endIndex ~= otherIndex else { return }
        swapAt(index, otherIndex)
    }
}

// MARK: - Methods (Equatable)
public extension Array where Element: Equatable {
    
    @discardableResult
    /// 移除数组内某个元素值相等的所有元素
    ///
    ///         [1, 2, 2, 3, 4, 5].removeAll(2) -> [1, 3, 4, 5]
    ///         ["h", "e", "l", "l", "o"].removeAll("l") -> ["h", "e", "o"]
    ///
    /// - Parameter item: 被移除的元素
    /// - Returns: 移除元素后的数组
    mutating func removeAll(_ item: Element) -> [Element] {
        removeAll(where: { $0 == item})
        return self
    }
    
    
    @discardableResult
    /// 移除数组中出现在items里面的元素
    ///
    ///          [1, 2, 2, 3, 4, 5].removeAll([2,5]) -> [1, 3, 4]
    ///          ["h", "e", "l", "l", "o"].removeAll(["l", "h"]) -> ["e", "o"]
    ///
    /// - Parameter items: 被移除的元素数组
    /// - Returns: 移除后的数组
    mutating func removeAll(_ items: [Element]) -> [Element] {
        guard !items.isEmpty else { return self }
        removeAll(where: { items.contains($0) })
        return self
    }
    
    
    /// 移除重复的元素
    ///
    ///          [1, 1, 2, 2, 3, 3, 3, 4, 5].removeDuplicates() -> [1, 2, 3, 4, 5])
    ///          ["h", "e", "l", "l", "o"].removeDuplicates() -> ["h", "e", "l", "o"])
    /// - Returns: 移除重复元素后的数组
    func removeDuplicates() -> [Element] {
        return reduce(into: [Element]()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
}
