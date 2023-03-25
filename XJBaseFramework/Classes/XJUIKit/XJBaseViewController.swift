//
//  XJBaseViewController.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/7.
//

import UIKit

public protocol XJBaseViewControllerProtocol: NSObject {
    var hideNavigationBar: Bool { get set }
    func resetNavigationBar()
}

open class XJBaseViewController<Container: UIView>: UIViewController, XJBaseViewControllerProtocol {
    
    /// 隐藏导航栏
    public var hideNavigationBar = false
    
    /// 是否显示返回按钮的标题，请在父类viewdidload之后调用
    var showBackButtonTitle: Bool = false {
        didSet {
            if showBackButtonTitle {
                navigationController?.navigationBar.topItem?.backButtonTitle = "返回"
            } else {
                navigationController?.navigationBar.topItem?.backButtonTitle = ""
            }
        }
    }

    open var container: Container { view as! Container }

    open override func loadView() {
        super.loadView()
        if view is Container {
            return
        }
        view = Container()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showBackButtonTitle = false
    }
    
    open func resetNavigationBar() {
        navigationController?.setNavigationBarHidden(hideNavigationBar, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
