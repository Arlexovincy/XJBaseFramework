//
//  XJCharacterExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/17.
//

import Foundation

// MARK: - Properties
public extension Character {
    
    /// 是否是Emoji表情
    var isEmoji: Bool {
        let scalarValue = String(self).unicodeScalars.first!.value
        switch scalarValue {
        case 0x1F600...0x1F64F, // Emoticons
             0x1F300...0x1F5FF, // Misc Symbols and Pictographs
             0x1F680...0x1F6FF, // Transport and Map
             0x1F1E6...0x1F1FF, // Regional country flags
             0x2600...0x26FF, // Misc symbols
             0x2700...0x27BF, // Dingbats
             0xE0020...0xE007F, // Tags
             0xFE00...0xFE0F, // Variation Selectors
             0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
             127_000...127_600, // Various asian characters
             65024...65039, // Variation selector
             9100...9300, // Misc items
             8400...8447: // Combining Diacritical Marks for Symbols
            return true
        default:
            return false
        }
    }
    
    /// 用整型表示
    ///     Character("1").int -> 1
    ///     Character("A").int -> nil
    var int: Int? {
        return Int(String(self))
    }
    
    /// 用字符串表示
    ///     Character("a").string -> "a"
    var string: String {
        return String(self)
    }
    
    /// 转成小写
    ///     Character("A").lowercased -> Character("a")
    var lowercased: Character {
        return String(self).lowercased().first!
    }
    
    /// 转成大写
    var uppercased: Character {
        return String(self).uppercased().first!
    }
}
