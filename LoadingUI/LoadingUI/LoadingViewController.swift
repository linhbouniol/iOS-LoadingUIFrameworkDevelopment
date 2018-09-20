//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Linh Bouniol on 9/19/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {
    
    var indeterminateLoadingView = IndeterminateLoadingView(frame: CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // creating and positioning the view
        view.addSubview(indeterminateLoadingView)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        indeterminateLoadingView.startAnimating()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        indeterminateLoadingView.stopAnimating()
    }
    
//    public func startAnimation() {
//        indeterminateLoadingView.startAnimating()
//    }
//    
//    public func stopAnimation() {
//        indeterminateLoadingView.stopAnimating()
//    }
    
    public var loadingColor: UIColor {
        get {
            return indeterminateLoadingView.loadingColor
        }
        set(newColor) {
            indeterminateLoadingView.loadingColor = newColor
        }
    }
    
    public var loadingSize: CGFloat {
        get {
            return indeterminateLoadingView.bounds.width
        }
        set(newSize) {
            indeterminateLoadingView.frame.size.width = newSize
            indeterminateLoadingView.frame.size.height = newSize
        }
    }
    
    public var loadingThickness: CGFloat {
        get {
            return indeterminateLoadingView.thickness
        }
        set(newThickness) {
            indeterminateLoadingView.thickness = newThickness
        }
        
    }

}
