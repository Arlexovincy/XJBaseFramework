//
//  XJUIKitConfigure.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/10.
//

import Foundation

public struct XJUIKitConfigure {
    
    // HUD指示器
    public struct XJHud {
        
        /// 加载中文本
        public static let loadingText: String = "加载中..."
        
        /// 延迟隐藏的时间（秒）
        public static let delayHideSecond: TimeInterval = 1.5
        
    }
    
    public struct XJEmptyView {
        
        /// 按钮圆角
        public static let buttonCornerRadius: CGFloat = 5
        
        /// stackView元素的间隔大小
        public static let stackViewSpacing: CGFloat = 10
        
        /// 图片宽度
        public static let imageWith: CGFloat = 100
        
        /// 图片高度
        public static let imageHeight: CGFloat = 100
        
        
    }
}
