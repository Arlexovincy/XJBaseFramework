//
//  XJBaseNavViewController.swift
//  XJBaseFramework
//
//  Created by 黎锡坚 on 2023/2/7.
//

import UIKit

public class XJBaseNavViewController: UINavigationController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        // Do any additional setup after loading the view.
        iOS15NavBarCompatibility()
    }
    
    /// iOS 15 navBar透明兼容
    private func iOS15NavBarCompatibility() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        } else {
            // Fallback on earlier versions
        }
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

extension XJBaseNavViewController: UINavigationControllerDelegate {
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            if let vc = viewControllers.last as? XJBaseViewControllerProtocol {
                vc.resetNavigationBar()
            }
        }
    }
}
