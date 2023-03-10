//
//  XJBaseViewController.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/7.
//

import UIKit

public protocol XJBaseViewControllerProtocol: NSObject {
    
}

open class XJBaseViewController<Container: UIView>: UIViewController {

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
