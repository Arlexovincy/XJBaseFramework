//
//  MyBaseTestView.swift
//  XJBaseFramework_Example
//
//  Created by 黎锡坚 on 2023/2/9.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import XJBaseFramework
import SnapKit

class MyBaseTestView: XJView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    lazy var hudTestingButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .gray
        button.setTitle("HUD测试", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(testingHud), for: .touchUpInside)
        return button
    }()
    
    lazy var emptyViewTestingButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .gray
        button.setTitle("空数据图", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(testingEmptyView), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(hudTestingButton)
        hudTestingButton.snp.makeConstraints { make in
            make.left.equalTo(100)
            make.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        addSubview(emptyViewTestingButton)
        emptyViewTestingButton.snp.makeConstraints { make in
            make.left.equalTo(hudTestingButton.snp.right).offset(50)
            make.top.equalTo(hudTestingButton)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    @objc func testingHud() {
        showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {[weak self] in
            self?.hideLoading()
            self?.showTips(tips: "这是一个测试")
        }))
        
    }
    
    @objc func testingEmptyView() {
        let emptyDFV = XJEmptyDefaultStateView(image: UIImage(named: "no_network")!, message: "这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试", buttonText: "隐藏")
        emptyDFV.backgroundColor = .yellow
        let emptyStateView = XJEmptyStateView(customV: emptyDFV)
        emptyStateView.actionBlock = { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.hideEmptyView(inView: strongSelf)
        }
        self.showEmptyView(emptyView: emptyStateView, inView: self, layoutEdgeInsert: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        
    }
    
}
