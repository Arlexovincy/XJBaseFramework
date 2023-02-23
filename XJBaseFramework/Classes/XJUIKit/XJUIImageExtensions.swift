//
//  XJUIImageExtensions.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/23.
//

import Foundation

// MARK: - Methods

public extension UIImage {
    
    /// 压缩UIImage
    /// - Parameter quality: 压缩质量：0.0 - 1.0
    /// - Returns: JPEG的UIImage
    func compressed(quality: CGFloat = 0.5) -> UIImage? {
        guard let data = jpegData(compressionQuality: quality) else { return nil }
        return UIImage(data: data)
    }
    
    /// 压缩UIImage的Data
    /// - Parameter quality: 压缩质量：0.0 - 1.0
    /// - Returns: 压缩后的Data
    func compressedData(quality: CGFloat = 0.5) -> Data? {
        return jpegData(compressionQuality: quality)
    }
    
    /// 裁剪图片
    /// - Parameter rect: 裁剪的位置大小
    /// - Returns: 裁剪后的图片
    func cropped(to rect: CGRect) -> UIImage {
        guard rect.size.width <= size.width, rect.size.height <= size.height else { return self }
        let scaledRect = rect.applying(CGAffineTransform(scaleX: scale, y: scale))
        guard let image = cgImage?.cropping(to: scaledRect) else { return self }
        return UIImage(cgImage: image, scale: scale, orientation: imageOrientation)
    }
    
    /// 利用高度作为锚点，等比例缩放图片
    /// - Parameters:
    ///   - toHeight: 高度
    ///   - opaque: 是否不透明
    /// - Returns: 缩放后的图片
    func scaled(toHeight: CGFloat, opaque: Bool = false) -> UIImage? {
        let scale = toHeight / size.height
        let newWidth = size.width * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: toHeight), opaque, self.scale)
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: toHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// 利用宽度作为锚点，等比例缩放图片
    /// - Parameters:
    ///   - toWidth: 宽度
    ///   - opaque: 是否不透明
    /// - Returns: 缩放后的图片
    func scaled(toWidth: CGFloat, opaque: Bool = false) -> UIImage? {
        let scale = toWidth / size.width
        let newHeight = size.height * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: toWidth, height: newHeight), opaque, self.scale)
        draw(in: CGRect(x: 0, y: 0, width: toWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// 生成带圆角的图片
    /// - Parameter radius: 圆角大小
    /// - Returns: 带圆角的图片
    func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
        let maxRadius = min(size.width, size.height) / 2
        let cornerRadius: CGFloat
        if let radius = radius, radius > 0, radius <= maxRadius {
            cornerRadius = radius
        } else {
            cornerRadius = maxRadius
        }

        UIGraphicsBeginImageContextWithOptions(size, false, scale)

        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 图片转成PNG data类型的base64编码
    /// - Returns: PNG data类型的base64编码
    func pngBase64String() -> String? {
        return pngData()?.base64EncodedString()
    }
    
    /// 图片转成JPEG data类型的base64编码
    /// - Parameter compressionQuality: 压缩质量
    /// - Returns: JPEG data类型的base64编码
    func jpegBase64String(compressionQuality: CGFloat) -> String? {
        return jpegData(compressionQuality: compressionQuality)?.base64EncodedString()
    }
}
