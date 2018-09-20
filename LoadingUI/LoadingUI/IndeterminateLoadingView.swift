//
//  IndeterminateLoadingView.swift
//  LoadingUI
//
//  Created by Linh Bouniol on 9/19/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import Foundation

class IndeterminateLoadingView: UIView, CAAnimationDelegate {
    
    // MARK: - Properties
    
    private(set) var isAnimating = false
    
    public var loadingColor: UIColor = .black {
        didSet {
            shapeLayer.strokeColor = loadingColor.cgColor
        }
    }
    
    public var thickness: CGFloat = 10.0 {
        didSet {
            shapeLayer.lineWidth = thickness
            shapeLayer.lineDashPattern = [NSNumber(value: Double(thickness*2.0))]
            setNeedsLayout()
        }
    }
    
    private let shapeLayer = CAShapeLayer()
    private let duration = 1.0
    private var shouldStopAnimationOnNextCycle = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupShapeLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupShapeLayer()
    }
    
    func startAnimating() {
        guard !isAnimating else { return }
        defer { isAnimating = true }
        
        startAnimation()
    }
    
    func stopAnimating() {
        guard isAnimating else { return }
        
        shouldStopAnimationOnNextCycle = true
    }
    
    // MARK: - Private
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shapeLayer.frame = layer.bounds
        
        let radius = min(bounds.width, bounds.height)/2.0 - thickness/2.0
        let rect = CGRect(x: bounds.midX - radius, y: bounds.midY - radius, width: radius * 2.0, height: radius * 2.0)
        let path = UIBezierPath(ovalIn: rect)
        
        shapeLayer.path = path.cgPath
    }
    
    private func setupShapeLayer() {
        
//        shapeLayer.frame = layer.bounds
        shapeLayer.strokeColor = loadingColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = thickness
        shapeLayer.lineCap = .round
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 0.0
        shapeLayer.lineDashPattern = [NSNumber(value: Double(thickness*2.0))]
        layer.addSublayer(shapeLayer)
        
//        let radius = min(bounds.width, bounds.height)/2.0 - thickness/2.0
//        let rect = CGRect(x: bounds.midX - radius, y: bounds.midY - radius, width: radius * 2.0, height: radius * 2.0)
//        let path = UIBezierPath(ovalIn: rect)
//
//        shapeLayer.path = path.cgPath
        
        setNeedsLayout()
    }
    
    private func startAnimation() {
        shouldStopAnimationOnNextCycle = false
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 0.0
        startAnimation(for: "strokeEnd", timing: .easeIn)
    }
    
    private func startAnimation(for keyPath: String, timing: CAMediaTimingFunctionName) {
        let animation = CABasicAnimation(keyPath: keyPath)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = duration
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: timing)
        shapeLayer.add(animation, forKey: keyPath)
    }
    
    // MARK: - CAAnimationDelegate
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard !shouldStopAnimationOnNextCycle else {
            shouldStopAnimationOnNextCycle = false
            isAnimating = false
            return
        }
        
        if let anim = anim as? CABasicAnimation, anim.keyPath == "strokeEnd" {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            shapeLayer.strokeStart = 0.0
            shapeLayer.strokeEnd = 1.0
            CATransaction.commit()
            shapeLayer.removeAllAnimations()
            startAnimation(for: "strokeStart", timing: .easeOut)
        }
        
        if let anim = anim as? CABasicAnimation, anim.keyPath == "strokeStart" {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            shapeLayer.strokeStart = 0.0
            shapeLayer.strokeEnd = 0.0
            CATransaction.commit()
            shapeLayer.removeAllAnimations()
            startAnimation(for: "strokeEnd", timing: .easeIn)
        }
    }
}
