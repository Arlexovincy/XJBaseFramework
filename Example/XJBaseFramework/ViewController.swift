//
//  ViewController.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 02/09/2023.
//  Copyright (c) 2023 AndreaArlex. All rights reserved.
//

import UIKit
import XJBaseFramework

class ViewController: UIViewController {
    
    var dataArray: [String] = [String]()
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        XJ_ILog("进入viewDidLoad")
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCustomCell")
        dataArray.append("BaseViewController")
        dataArray.append("Testing ArrayExtensions")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell") {
            cell.textLabel?.textColor = .red
            cell.textLabel?.text = dataArray[indexPath.row]
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0: //BaseViewController
            let vc = MyTest1ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1: //Testing ArrayExtensions
            testingArrayExtensions()
        default:
            break
        }
    }
    
    func testingArrayExtensions() {
        var arr = [2, 3, 4, 5]
        arr.preAppend(1)
        print(arr)
        
        arr.safeSwap(from: 0, to: 4)
        print(arr)
        
        var arr2 = [1, 2, 2, 3, 4, 5]
        arr2.removeAll(2)
        print(arr2)
        
        let dValue = -12.22223
        print(dValue.abs)
        
        let aStr = "1--a"
        print(aStr.isOnlyLetters)
    }
    
}

