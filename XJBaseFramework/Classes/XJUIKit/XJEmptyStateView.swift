//
//  XJEmptyStateView.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/12.
//

import UIKit

public protocol XJEmptuStateViewProtocol: UIView {
    
    /// 点击动作
    var actionBlock: (() -> ())? { get set }
}


open class XJEmptyDefaultStateView: UIView, XJEmptuStateViewProtocol {
    open var actionBlock: (() -> ())?
    
    /// 图片
    fileprivate(set) open var imageView: UIImageView!
    
    /// 提示label
    fileprivate(set) open var textLabel: UILabel!
    
    /// 事件按钮
    fileprivate(set) open var button: UIButton!
    
    /// 图片
    open var image: UIImage? {
        get {
            return imageView.image
        }set {
            imageView.image = newValue
        }
    }
    
    /// 提示文案
    open var message: String {
        get {
            return textLabel.text ?? ""
        }set {
            textLabel.text = newValue
        }
    }
    
    /// 按钮文案
    open var buttonText: String {
        get {
            return button.title(for: []) ?? ""
        }set {
            button.setTitle(newValue, for: [])
        }
    }
    
    /// button 的 tint color
    var buttonTint: UIColor {
        get {
            return button.tintColor
        }set {
            button.tintColor = newValue
        }
    }
    
    /// 是否隐藏button
    var isButtonHidden: Bool = false {
        didSet {
            button.isHidden = isButtonHidden
        }
    }
    
    /// 按钮文案的颜色
    var buttonTextColor: UIColor? {
        get {
            return button.titleLabel?.textColor
        }set {
            button.titleLabel?.textColor = newValue
        }
    }
    
    /// 请一定要使用这个初始化方法
    /// - Parameters:
    ///   - image: 图片
    ///   - message: 提示文案
    ///   - buttonText: 按钮文案
    convenience public init(image: UIImage, message: String?, buttonText: String?) {
        self.init(frame: .zero)
        self.image = image
        self.message = message ?? ""
        self.buttonText = buttonText ?? ""
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        imageView = setupImage()
        textLabel = setupLabel()
        button = setupButton()
        
        let stackView = setupStackView(imageView, textLabel, button)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        // layout
        setupUIlayout(stackView: stackView)
    }
    
    /// 生成文本视图
    /// - Returns: 文本视图
    open func setupLabel() -> UILabel {
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 2
        return textLabel
    }
    
    /// 生成图片视图
    /// - Returns: 图片视图
    open func setupImage() -> UIImageView {
        return UIImageView()
    }
    
    /// 生成按钮视图
    /// - Returns: 按钮
    open func setupButton() -> UIButton {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(buttonClickAction), for: .touchUpInside)
        button.layer.cornerRadius = XJUIKitConfigure.XJEmptyView.buttonCornerRadius
        return button
    }
    
    /// 组合视图
    /// - Parameters:
    ///   - imageView: 图片
    ///   - textLabel: 文案
    ///   - button: 按钮
    /// - Returns: 组合视图
    open func setupStackView(_ imageView: UIImageView, _ textLabel: UILabel, _ button: UIButton) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [imageView,textLabel,button])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = XJUIKitConfigure.XJEmptyView.stackViewSpacing
        return stackView
    }
    
    /// 配置布局(only layout)
    open func setupUIlayout(stackView: UIStackView) {
        
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    /// 按钮点击
    @objc private func buttonClickAction() {
        actionBlock?()
    }
    
}


public class XJEmptyStateView: UIControl {
    
    /// 自定义视图
    fileprivate(set) public var customView: XJEmptuStateViewProtocol
    
    /// 点击动作
    public var actionBlock: (() -> ())?
    
    /// 初始化方法，请调用它
    /// - Parameter customV: 自定义视图
    public init(customV: XJEmptuStateViewProtocol) {
        self.customView = customV
        super.init(frame: .zero)
        customUILayout()
        
        self.customView.actionBlock = { [weak self] in
            self?.actionBlock?()
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 布局
    private func customUILayout() {
        addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        customView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        customView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
