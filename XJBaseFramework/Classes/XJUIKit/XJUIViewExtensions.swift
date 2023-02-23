//
//  XJUIViewExtensions.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/23.
//

import UIKit

// MARK: - Properties

public extension UIView {
    
    /// layer border 的颜色
    var layerBorderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            // Fix React-Native conflict issue
            guard String(describing: type(of: color)) != "__NSCFType" else { return }
            layer.borderColor = color.cgColor
        }
    }
    
    /// layer border 的宽度
    var layerBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    /// layer border 的圆角
    var layerCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    /// 高度
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    /// 宽度
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    /// x 方向的位置
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    /// y 方向的位置
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    /// 大小
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    /// 截图
    var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}


// MARK: - Methods

public extension UIView {
    /// SwifterSwift: 设置UIView的某一方向的圆角.
    ///
    /// - Parameters:
    ///   - corners: 数组（要改变圆角的位置） (example: [.bottomLeft, .topRight]).
    ///   - radius: 圆角的大小
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))

        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
