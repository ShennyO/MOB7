//
//  LoadingIndicatorViewController.swift
//  MOB7Challenges
//
//  Created by Sunny Ouyang on 5/16/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class LoadingIndicatorViewController: UIViewController {

    var whiteLayer: CALayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCircleAndAnimate()
        let tap = UITapGestureRecognizer(target: self, action: #selector(endAnimations))
        
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    
    
    func createCircleAndAnimate() {
        //create the baseView for the loading animation
        
        let baseViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        let baseView = UIView(frame: baseViewFrame)
        baseView.layer.zPosition = 5
        self.view.addSubview(baseView)
        
        let circleWidthHeight = baseViewFrame.width * 0.4
        let path = UIBezierPath(ovalIn: CGRect(x: -circleWidthHeight / 2, y: -circleWidthHeight / 2, width: circleWidthHeight, height: circleWidthHeight)).cgPath
        //create the circle layer
        let circleLayer = CAShapeLayer()
        circleLayer.position = baseView.center
        circleLayer.path = path
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 7
        circleLayer.strokeStart = 0.1
        circleLayer.strokeEnd = 1
        circleLayer.fillColor = UIColor.clear.cgColor
        baseView.layer.addSublayer(circleLayer)
        
        
        //animate the circle
        
        let strokeStartAnim = CABasicAnimation()
        strokeStartAnim.toValue = 0.5
        strokeStartAnim.repeatCount = Float(Int.max)
        strokeStartAnim.keyPath = #keyPath(CAShapeLayer.strokeStart)
        
        let strokeEndAnim = CABasicAnimation()
        strokeEndAnim.toValue = 0.6
        strokeEndAnim.repeatCount = Float(Int.max)
        strokeEndAnim.keyPath = #keyPath(CAShapeLayer.strokeEnd)
        
        let groupAnim = CAAnimationGroup()
        groupAnim.animations = [strokeStartAnim, strokeEndAnim]
        groupAnim.duration = 1.5
        groupAnim.beginTime = 0
        groupAnim.speed = 1
        groupAnim.autoreverses = true
        groupAnim.repeatCount = .greatestFiniteMagnitude
        circleLayer.add(groupAnim, forKey: "groupAnimation")
        
        
        let duration: CFTimeInterval = 1
        //type of the animation
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(-Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        circleLayer.add(rotateAnimation, forKey: nil)
        
        //add a view for the circle in the middle
        let circleViewFrame = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: circleWidthHeight, height: circleWidthHeight)
        let circleView = UIView(frame: circleViewFrame)
        circleView.layer.cornerRadius = (circleWidthHeight) / 2
        circleView.backgroundColor = UIColor.green.withAlphaComponent(0.8)
        circleView.center = self.view.center
        circleView.alpha = 1
        circleView.layer.zPosition = 1
        self.view.addSubview(circleView)
        
        whiteLayer = CALayer()
        whiteLayer?.frame = CGRect(x: 50, y: 50, width: circleWidthHeight, height: circleWidthHeight)
        whiteLayer?.position = CGPoint(x: circleView.bounds.midX, y: circleView.bounds.midY)
        whiteLayer?.cornerRadius = circleWidthHeight / 2
        whiteLayer?.backgroundColor = UIColor.white.cgColor
        circleView.layer.addSublayer(whiteLayer!)
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                
                //stopping the animation and completing the circle
                circleLayer.removeAllAnimations()
                circleLayer.strokeStart = 0
                circleLayer.strokeEnd = 1
                circleLayer.strokeColor = UIColor.clear.cgColor
            }, completion: { (bool) in
                return bool
            })
            
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 4, delay: 5, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: [], animations: {
                
                //shrinking the whitelayer
                self.whiteLayer?.bounds = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                
            }, completion: { (bool) in
                return bool
            })
        }
        
    }
    
    
    @objc func endAnimations() {
        
    }
    

}
