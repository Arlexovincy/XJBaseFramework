//
//  XJUIButtonExtensions.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/25.
//

import UIKit

public enum ButtonImagePosition: Int {
    case top
    case left
    case right
    case bottom
}

public extension UIButton {
    
    /// 设置图片和文字
    /// - Parameters:
    ///   - image: 图片
    ///   - title: 文字
    ///   - position: 图片的位置
    ///   - space: 间距
    func setImageAndTitle(image: UIImage, title: String, position: ButtonImagePosition, space: CGFloat) {
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            var fontContainer = AttributeContainer()
            fontContainer.font = self.titleLabel?.font
            fontContainer.foregroundColor = self.titleLabel?.textColor
            let attributedStr = AttributedString(title, attributes: fontContainer)
            configuration.attributedTitle = attributedStr
            configuration.image = image
            switch position {
            case .top:
                configuration.imagePlacement = .top
            case .left:
                configuration.imagePlacement  = .leading
            case .right:
                configuration.imagePlacement = .trailing
            case .bottom:
                configuration.imagePlacement = .bottom
            }
            configuration.imagePadding = space
            configuration.titleAlignment = .leading
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            self.configuration = configuration
        } else {
            setTitle(title, for: .normal)
            setImage(image, for: .normal)
            
            let imageWidth: CGFloat = imageView?.frame.size.width ?? 0.0
            let imageHeight: CGFloat = imageView?.frame.size.height ?? 0.0
            
            let labelWidth: CGFloat = titleLabel?.intrinsicContentSize.width ?? 0.0
            let labelHeight: CGFloat = titleLabel?.intrinsicContentSize.height ?? 0.0
            
            var imageEdgeInsets: UIEdgeInsets = UIEdgeInsets()
            var labelEdgeInsets: UIEdgeInsets = UIEdgeInsets()
            
            switch position {
            case .top:
                imageEdgeInsets = UIEdgeInsets(top: (-labelHeight) - (space / 2.0), left: 0, bottom: 0, right: -labelWidth)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight - space / 2.0, right: 0)
            case .left:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0)
            case .right:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-space/2.0, bottom: 0, right: imageWidth+space/2.0)
            case .bottom:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
                labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWidth, bottom: 0, right: 0)
            }
            self.titleEdgeInsets = labelEdgeInsets
            self.imageEdgeInsets = imageEdgeInsets
        }
    }
}
