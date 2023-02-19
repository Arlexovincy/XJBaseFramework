//
//  XJStringExtensions.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/19.
//

import Foundation

// MARK: - Properties

public extension String {
    
    /// Base64解密
    ///
    ///     "SGVsbG8gV29ybGQh".base64Decoded = Optional("Hello World!")
    ///
    var base64Decoded: String? {
        if let data = Data(base64Encoded: self,
                           options: .ignoreUnknownCharacters) {
            return String(data: data, encoding: .utf8)
        }
        
        let remainder = count % 4
        
        var padding = ""
        if remainder > 0 {
            padding = String(repeating: "=", count: 4 - remainder)
        }
        
        guard let data = Data(base64Encoded: self + padding,
                              options: .ignoreUnknownCharacters) else { return nil }
        
        return String(data: data, encoding: .utf8)
    }
    
    /// Base64加密
    ///
    ///     "Hello World!".base64Encoded -> Optional("SGVsbG8gV29ybGQh")
    ///
    var base64Encoded: String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    /// 转成字符（character）数组
    var charactersArray: [Character] {
        return Array(self)
    }
    
    /// 是否包含Emoji表情
    var containEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        for scalar in unicodeScalars {
            switch scalar.value {
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
                continue
            }
        }
        return false
    }
    
    /// 是否包含字母
    ///
    ///     "123abc".hasLetters -> true
    ///     "123".hasLetters -> false
    ///
    var hasLetters: Bool {
        guard !isEmpty else {
            return false
        }
        return rangeOfCharacter(from: .letters, range: nil) != nil
    }
    
    /// 是否包含数字
    ///
    ///     "abcd".hasNumbers -> false
    ///     "123abc".hasNumbers -> true
    ///
    var hasNumbers: Bool {
        guard !isEmpty else {
            return false
        }
        return rangeOfCharacter(from: .decimalDigits, range: nil) != nil
    }
    
    /// 是否是合法的邮箱
    var isValidEmail: Bool {
        // http://emailregex.com/
        let regex =
            "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    /// 是否是合法的URL
    var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    /// URL是否合法并且以https开头
    var isValidHttpsUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "https"
    }
    
    /// URL是否合法并且以http开头
    var isValidHttpUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "http"
    }
    
    /// 是否是合法的file协议url
    ///
    ///     "file://Documents/file.txt".isValidFileUrl -> true
    ///
    var isValidFileUrl: Bool {
        return URL(string: self)?.isFileURL ?? false
    }
    
    /// 是否是纯数字
    ///
    ///     "123".isDigits -> true
    ///     "1.3".isDigits -> false
    ///     "abc".isDigits -> false
    ///
    var isDigits: Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    
    /// 用BOOL表示
    ///
    ///     "1".bool -> true
    ///     "False".bool -> false
    ///     "Hello".bool = nil
    ///
    var bool: Bool? {
        let selfLowercased = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        switch selfLowercased {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    /// 用Int表示
    var int: Int? {
        return Int(self)
    }
    
    /// 转成url
    var url: URL? {
        return URL(string: self)
    }
    
    /// 去掉空格和换行
    ///
    ///     "   hello  \n".trimmed -> "hello"
    ///
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// url编码
    var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    /// url解码
    var urlDecoded: String {
        return removingPercentEncoding ?? self
    }
    
    /// 去掉空格和换行
    ///
    ///     "   \n master   \n  master  ".withoutSpacesAndNewLines -> "mastermaster"
    ///
    var withoutSpacesAndNewLines: String {
        return replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "")
    }
    
    /// 是否只包含空格
    var isWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

// MARK: - Methods

public extension String {
    
    /// 安全索引访问
    ///
    ///        "Hello World!"[safe: 3] -> "l"
    ///        "Hello World!"[safe: 20] -> nil
    ///
    /// - Parameter index: index.
    subscript(safe index: Int) -> Character? {
        guard index >= 0, index < count else { return nil }
        return self[self.index(startIndex, offsetBy: index)]
    }
    
    /// 安全索引访问（Range）
    ///
    ///        "Hello World!"[safe: 6..<11] -> "World"
    ///        "Hello World!"[safe: 21..<110] -> nil
    ///
    ///        "Hello World!"[safe: 6...11] -> "World!"
    ///        "Hello World!"[safe: 21...110] -> nil
    ///
    /// - Parameter range: range.
    subscript<R>(safe range: R) -> String? where R: RangeExpression, R.Bound == Int {
        let range = range.relative(to: Int.min..<Int.max)
        guard range.lowerBound >= 0,
            let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex),
            let upperIndex = index(startIndex, offsetBy: range.upperBound, limitedBy: endIndex) else {
            return nil
        }

        return String(self[lowerIndex..<upperIndex])
    }
    
    /// 是否包含子字符串
    ///
    ///        "Hello World!".contain("O") -> false
    ///        "Hello World!".contain("o", caseSensitive: false) -> true
    ///
    /// - Parameters:
    ///   - string: 子字符串
    ///   - caseSensitive: 是否区分大小写
    /// - Returns: true：包含 false： 不包含
    func contains(_ string: String, caseSensitive: Bool = true) -> Bool {
        if !caseSensitive {
            return range(of: string, options: .caseInsensitive) != nil
        }
        return range(of: string) != nil
    }
    
    @discardableResult
    
    /// 字符串反转
    /// - Returns: 反转后的字符串
    mutating func reverse() -> String {
        let chars: [Character] = reversed()
        self = String(chars)
        return self
    }
    
    /// 字符串切片
    ///
    ///     "Hello World".slicing(from: 6, length: 5) -> "World"
    ///
    /// - Parameters:
    ///   - index: 起始位置
    ///   - length: 长度
    /// - Returns: 切片后的字符串
    func slicing(from index: Int, length: Int) -> String? {
        guard length >= 0, index >= 0, index < count else { return nil }
        guard index.advanced(by: length) <= count else {
            return self[safe: index..<count]
        }
        guard length > 0 else { return "" }
        return self[safe: index..<index.advanced(by: length)]
    }
    
    @discardableResult
    
    /// 字符串切片，如果切片后是nil则返回原来的字符串
    ///
    ///        var str = "Hello World"
    ///        str.slice(from: 6, length: 5)
    ///        print(str) // prints "World"
    ///
    /// - Parameters:
    ///   - index: 起始位置
    ///   - length: 长度
    /// - Returns: 切片后的字符串
    mutating func slice(from index: Int, length: Int) -> String {
        if let str = slicing(from: index, length: length) {
            self = String(str)
        }
        return self
    }
    
    @discardableResult
    
    /// 字符串切片
    ///
    ///        var str = "Hello World"
    ///        str.slice(from: 6, to: 11)
    ///        print(str) // prints "World"
    ///
    /// - Parameters:
    ///   - start: 开始位置
    ///   - end: 结束位置
    /// - Returns: 切片后的字符串
    mutating func slice(from start: Int, to end: Int) -> String {
        guard end >= start else { return self }
        if let str = self[safe: start..<end] {
            self = str
        }
        return self
    }
    
    @discardableResult
    
    /// 字符串切片，从设置的开始位置到最后
    ///
    ///        var str = "Hello World"
    ///        str.slice(at: 6)
    ///        print(str) // prints "World"
    ///
    /// - Parameter index: 开始位置，
    mutating func slice(at index: Int) -> String {
        guard index < count else { return self }
        if let str = self[safe: index..<count] {
            self = str
        }
        return self
    }
    
    /// 使用指定的格式转换成日期.
    ///
    ///        "2017-01-15".date(withFormat: "yyyy-MM-dd") -> Date set to Jan 15, 2017
    ///        "not date string".date(withFormat: "yyyy-MM-dd") -> nil
    ///
    /// - Parameter format: 日期格式.
    /// - Returns: 日期.
    func date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
    /// 去掉空格和换行
    ///
    ///        var str = "  \n Hello World \n\n\n"
    ///        str.trim()
    ///        print(str) // prints "Hello World"
    ///
    @discardableResult
    mutating func trim() -> String {
        self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return self
    }
    
    /// 只截取length个字符，超过的以...（trailing）的形式展示(会修改原字符串)
    ///
    ///        var str = "This is a very long sentence"
    ///        str.truncate(toLength: 14)
    ///        print(str) // prints "This is a very..."
    ///
    /// - Parameters:
    ///   - toLength: 最大长度
    ///   - trailing: 末尾追加的字符串，默认是...
    @discardableResult
    mutating func truncate(toLength length: Int, trailing: String? = "...") -> String {
        guard length > 0 else { return self }
        if count > length {
            self = self[startIndex..<index(startIndex, offsetBy: length)] + (trailing ?? "")
        }
        return self
    }
    
    /// 只截取length个字符，超过的以...（trailing）的形式展示(不会修改原字符串)
    ///
    ///        "This is a very long sentence".truncated(toLength: 14) -> "This is a very..."
    ///        "Short sentence".truncated(toLength: 14) -> "Short sentence"
    ///
    /// - Parameters:
    ///   - toLength: 最大长度
    ///   - trailing: 末尾追加的字符串，默认是...
    /// - Returns: 处理后的字符串
    func truncated(toLength length: Int, trailing: String? = "...") -> String {
        guard 0..<count ~= length else { return self }
        return self[startIndex..<index(startIndex, offsetBy: length)] + (trailing ?? "")
    }
    
    /// url解码
    ///
    ///        var str = "it's%20easy%20to%20decode%20strings"
    ///        str.urlDecode()
    ///        print(str) // prints "it's easy to decode strings"
    ///
    @discardableResult
    mutating func urlDecode() -> String {
        if let decoded = removingPercentEncoding {
            self = decoded
        }
        return self
    }
    
    /// url编码
    ///
    ///        var str = "it's easy to encode strings"
    ///        str.urlEncode()
    ///        print(str) // prints "it's%20easy%20to%20encode%20strings"
    ///
    @discardableResult
    mutating func urlEncode() -> String {
        if let encoded = addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            self = encoded
        }
        return self
    }
    
    /// 匹配正则表达式
    ///
    ///         "123".matches(pattern: "\\d{3}"
    ///
    /// - Parameter pattern: 正则表达式
    /// - Returns: 是否匹配
    func matches(pattern: String) -> Bool {
        return range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    /// 匹配正则表达式
    ///
    ///         let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    ///         "email@mail.com".matches(regex: try NSRegularExpression(pattern: emailPattern))
    ///
    /// - Parameters:
    ///   - regex: regex
    ///   - options: 选项
    /// - Returns: 是否匹配
    func matches(regex: NSRegularExpression, options: NSRegularExpression.MatchingOptions = []) -> Bool {
        let range = NSRange(startIndex..<endIndex, in: self)
        return regex.firstMatch(in: self, options: options, range: range) != nil
    }
}

// MARK: - Initializers

public extension String {
    
    
    /// 使用base64加密的字符串来创建一个字符串
    ///
    ///        String(base64: "SGVsbG8gV29ybGQh") = "Hello World!"
    ///        String(base64: "hello") = nil
    ///
    /// - Parameter base64: base64 string
    init?(base64: String) {
        guard let decodedData = Data(base64Encoded: base64) else { return nil }
        guard let str = String(data: decodedData, encoding: .utf8) else { return nil }
        self.init(str)
    }
}
