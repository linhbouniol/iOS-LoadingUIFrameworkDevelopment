//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Linh Bouniol on 9/19/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {
    
    var indeterminateLoadingView: IndeterminateLoadingView!

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // creating and positioning the view
        indeterminateLoadingView = IndeterminateLoadingView(frame: CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        view.addSubview(indeterminateLoadingView)
        
        indeterminateLoadingView.startAnimating()
    }
    
//    public func startAnimation() {
//        indeterminateLoadingView.startAnimating()
//    }
//    
//    public func stopAnimation() {
//        indeterminateLoadingView.stopAnimating()
//    }

}
