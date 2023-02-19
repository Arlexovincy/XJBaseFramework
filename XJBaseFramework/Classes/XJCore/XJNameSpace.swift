//
//  XJNameSpace.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/17.
//

import Foundation

public protocol TypeWrapper {
    associatedtype WrappedType
    var wrapped: WrappedType { get }
    init(val: WrappedType)
}

public protocol NamespaceWrap {
    associatedtype WrapperType
    var XJ: WrapperType { get }
}

public struct NamespaceWrapper<T>: TypeWrapper {
    public var wrapped: T
    public init(val: T) {
        self.wrapped = val
    }
}

public extension NamespaceWrap {
    var XJ: NamespaceWrapper<Self> {
        return NamespaceWrapper(val: self)
    }
}
