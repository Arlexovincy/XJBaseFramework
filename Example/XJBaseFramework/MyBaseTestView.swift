//
//  MyBaseTestView.swift
//  XJBaseFramework_Example
//
//  Created by 黎锡坚 on 2023/2/9.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class MyBaseTestView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
