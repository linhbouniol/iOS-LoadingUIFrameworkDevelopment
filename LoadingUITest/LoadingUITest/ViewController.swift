//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Linh Bouniol on 9/19/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: UIViewController {

//    let loadingVC = LoadingViewController()
    
    @IBAction func showLoadingVC(_ sender: Any) {
        // test if loading view controller works
        let loadingVC = LoadingViewController()
        
        loadingVC.loadingColor = .red
        loadingVC.loadingSize = 100
        loadingVC.loadingThickness = 2
        
        present(loadingVC, animated: true, completion: nil)
    }
    
//    @IBAction func stopAnimation(_ sender: Any) {
//        loadingVC.stopAnimation()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
