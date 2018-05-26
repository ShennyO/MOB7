//
//  LoadingViewController.swift
//  MOB7Challenges
//
//  Created by Sunny Ouyang on 5/17/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    var baseView: UIView!
    var colorView: UIView!
    var triangleLayerOne: CAShapeLayer!
    var triangleLayerTwo: CAShapeLayer!
    var baseCircleLayer: CAShapeLayer!
    var checkMark: CAShapeLayer!
    var layerOne: CAShapeLayer!
    var layerTwo: CAShapeLayer!
    var rotateAnimation: CABasicAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.backgroundColor = UIColor(rgb: 0x333333).cgColor
        //not showing up because i forgot to call the function
        createLoadingAnimation()
        // Do any additional setup after loading the view.
    }
    
    

    func createLoadingAnimation() {
        
        
        
        //MARK: CREATING THE BASE VIEW
        
        //first thing we want to do is create a base view in the middle of the screen
        let baseFrame = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: self.view.bounds.width * 0.4, height: self.view.bounds.width * 0.4)
        baseView = UIView(frame: baseFrame)
        //center rearranges the center point of our view
        baseView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        baseView.layer.cornerRadius = baseFrame.width / 2
        baseView.layer.backgroundColor = self.view.backgroundColor?.cgColor
        baseView.layer.zPosition = 3
        self.view.addSubview(baseView)
        
        colorView = UIView(frame: baseFrame)
        colorView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        colorView.layer.zPosition = 2
        colorView.layer.cornerRadius = baseFrame.width / 2
        colorView.backgroundColor = UIColor.green
        self.view.addSubview(colorView)
        
        //MARK: CREATING THE BEZIER PATHS
        
        //creating bezier paths for the checkmark
        
        
        
        let circleWidthHeight = baseFrame.width
        let path = UIBezierPath(ovalIn: CGRect(x: -circleWidthHeight / 2, y: -circleWidthHeight / 2, width: circleWidthHeight, height: circleWidthHeight))
        
        
        //right triangle
        let rightTriangle = UIBezierPath()
        let rightStartingPoint = CGPoint(x: baseView.bounds.maxX - (baseView.bounds.maxX * 0.14), y: baseView.bounds.midY - (baseView.bounds.midY * 0.2))
        let rightSecondPoint = CGPoint(x: baseView.bounds.maxX + (baseView.bounds.maxX * 0.1266), y: baseView.bounds.midY - (baseView.bounds.midY * 0.2))
        let rightThirdPoint = CGPoint(x: baseView.bounds.maxX - 1, y: baseView.bounds.midY + (baseView.bounds.midY * 0.266))
        rightTriangle.move(to: rightStartingPoint)
        rightTriangle.addLine(to: rightSecondPoint)
        rightTriangle.addLine(to: rightThirdPoint)
        rightTriangle.close()
        
        //left triangle
        let leftTriangle = UIBezierPath()
        let leftStartingPoint = CGPoint(x: baseView.bounds.minX + (baseView.bounds.maxX * 0.14), y: baseView.bounds.midY + (baseView.bounds.midY * 0.2))
        let leftSecondPoint = CGPoint(x: baseView.bounds.minX - (baseView.bounds.maxX * 0.1266), y: baseView.bounds.midY + (baseView.bounds.midY * 0.2))
        let leftThirdPoint = CGPoint(x: baseView.bounds.minX + 1, y: baseView.bounds.midY - (baseView.bounds.midY * 0.266))
        leftTriangle.move(to: leftStartingPoint)
        leftTriangle.addLine(to: leftSecondPoint)
        leftTriangle.addLine(to: leftThirdPoint)
        leftTriangle.close()
        
        
        //MARK: BEZIER PATHS END
        
    
        //MARK: CREATING OUR CASHAPELAYERS
        
        //adding the top right triangle layer
        triangleLayerOne = CAShapeLayer()
        triangleLayerOne.path = rightTriangle.cgPath
        triangleLayerOne.strokeColor = UIColor.white.cgColor
        triangleLayerOne.fillColor = UIColor.white.cgColor
        triangleLayerOne.zPosition = 5
        
        //adding the bottom left triangle layer
        triangleLayerTwo = CAShapeLayer()
        triangleLayerTwo.path = leftTriangle.cgPath
        triangleLayerTwo.strokeColor = UIColor.white.cgColor
        triangleLayerTwo.fillColor = UIColor.white.cgColor
        triangleLayerTwo.zPosition = 5
        
        //adding the full circle
        baseCircleLayer = CAShapeLayer()
        baseCircleLayer.path = path.cgPath
        baseCircleLayer.position = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
        baseCircleLayer.fillColor = UIColor.clear.cgColor
        baseCircleLayer.strokeColor = UIColor.white.cgColor
        baseCircleLayer.lineWidth = 16
        
        
        //adding the white curve one
        layerOne = CAShapeLayer()
        layerOne.position = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
        layerOne.path = path.cgPath
        layerOne.fillColor = UIColor.clear.cgColor
        layerOne.strokeColor = self.view.backgroundColor?.cgColor
        layerOne.lineWidth = 18
        layerOne.strokeStart = 0.5
        layerOne.strokeEnd = 0.6
        layerOne.zPosition = 4
        
        //positions of our sublayer's aren't centered to its view
        //To position it in the middle, we have to have the circle's x & y equal to the negative of our circle's width divided by two
        
        //adding white curve two
        layerTwo = CAShapeLayer()
        layerTwo.position = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
        layerTwo.path = path.cgPath
        layerTwo.fillColor = UIColor.clear.cgColor
        layerTwo.strokeColor = self.view.backgroundColor?.cgColor
        layerTwo.lineWidth = 18
        layerTwo.strokeStart = 0
        layerTwo.strokeEnd = 0.1
        layerTwo.zPosition = 4
        
        //adding out triangle sublayers and curved sublayers to our baseview sublayer
        
        baseView.layer.addSublayer(layerOne)
        baseView.layer.addSublayer(layerTwo)
        baseView.layer.addSublayer(baseCircleLayer)
        baseView.layer.addSublayer(triangleLayerOne)
        baseView.layer.addSublayer(triangleLayerTwo)
        createCheckMark()
        
        
        //Animation for the top curve
        
        let strokeStartAnim = CABasicAnimation()
        strokeStartAnim.toValue = 0.5
        strokeStartAnim.repeatCount = Float(Int.max)
        strokeStartAnim.keyPath = #keyPath(CAShapeLayer.strokeStart)
        
        let strokeEndAnim = CABasicAnimation()
        strokeEndAnim.toValue = 0.9
        strokeEndAnim.repeatCount = Float(Int.max)
        strokeEndAnim.keyPath = #keyPath(CAShapeLayer.strokeEnd)
        
        let groupAnim = CAAnimationGroup()
        groupAnim.animations = [strokeStartAnim, strokeEndAnim]
        groupAnim.duration = 0.6
        groupAnim.beginTime = 0
        groupAnim.speed = 1
        groupAnim.autoreverses = true
        groupAnim.repeatCount = .greatestFiniteMagnitude
        baseView.layer.sublayers![0].add(groupAnim, forKey: "groupAnimation")

        
        //Animation for the bottom curve
        
        let strokeStartAnimTwo = CABasicAnimation()
        strokeStartAnimTwo.toValue = 0
        strokeStartAnimTwo.repeatCount = Float(Int.max)
        strokeStartAnimTwo.keyPath = #keyPath(CAShapeLayer.strokeStart)
        
        let strokeEndAnimTwo = CABasicAnimation()
        strokeEndAnimTwo.toValue = 0.4
        strokeStartAnimTwo.repeatCount = Float(Int.max)
        strokeEndAnimTwo.keyPath = #keyPath(CAShapeLayer.strokeEnd)
        
        let groupAnimTwo = CAAnimationGroup()
        groupAnimTwo.animations = [strokeStartAnimTwo, strokeEndAnimTwo]
        groupAnimTwo.duration = 0.6
        groupAnimTwo.beginTime = 0
        groupAnimTwo.speed = 1
        groupAnimTwo.autoreverses = true
        groupAnimTwo.repeatCount = .greatestFiniteMagnitude
        baseView.layer.sublayers![1].add(groupAnimTwo, forKey: "groupAnimationTwo")

       
        
        let duration: CFTimeInterval = 1.25
        //type of the animation
        rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        baseView.layer.add(rotateAnimation, forKey: "rotation")
        
    }
    
    //animating the filling in of the circle
    func endAnimations(completion: @escaping() -> ()) {
        
        
        let strokeStartAnim = CABasicAnimation()
        strokeStartAnim.toValue = 0.485
        strokeStartAnim.keyPath = #keyPath(CAShapeLayer.strokeStart)
        
        let strokeEndAnim = CABasicAnimation()
        strokeEndAnim.toValue = 0.485
        strokeEndAnim.keyPath = #keyPath(CAShapeLayer.strokeEnd)
        
        let groupAnim = CAAnimationGroup()
        groupAnim.animations = [strokeStartAnim, strokeEndAnim]
        groupAnim.duration = 2
        groupAnim.beginTime = 0
        groupAnim.speed = 1
        baseView.layer.sublayers![0].add(groupAnim, forKey: "groupEndAnimation")
        
        
        
        let strokeStartAnimTwo = CABasicAnimation()
        strokeStartAnimTwo.toValue = 0
        strokeStartAnimTwo.keyPath = #keyPath(CAShapeLayer.strokeStart)
        
        let strokeEndAnimTwo = CABasicAnimation()
        strokeEndAnimTwo.toValue = 0
        strokeEndAnimTwo.keyPath = #keyPath(CAShapeLayer.strokeEnd)
        
        let groupAnimTwo = CAAnimationGroup()
        groupAnimTwo.animations = [strokeStartAnimTwo, strokeEndAnimTwo]
        groupAnimTwo.duration = 2
        groupAnimTwo.beginTime = 0
        groupAnimTwo.speed = 1
        baseView.layer.sublayers![1].add(groupAnimTwo, forKey: "groupEndAnimationTwo")
        completion()
    }
    
    //removing the clear layers
    func removeTransparentLayers(completion: @escaping ()->()) {
        self.layerOne.removeFromSuperlayer()
        self.layerTwo.removeFromSuperlayer()
        completion()
    }
    
    
    func createCheckMark() {
        let checkmarkPath = UIBezierPath()
        let checkStartingPoint = CGPoint(x: 0, y: 0)
        let checkSecondPoint = CGPoint(x: 0, y: 20)
        let checkThirdPoint = CGPoint(x: 50, y: 20)
        checkmarkPath.move(to: checkStartingPoint)
        checkmarkPath.addLine(to: checkSecondPoint)
        checkmarkPath.addLine(to: checkThirdPoint)
        
        checkMark = CAShapeLayer()
        checkMark.path = checkmarkPath.cgPath
        checkMark.fillColor = colorView.backgroundColor?.cgColor
        checkMark.strokeColor = UIColor.white.cgColor
        checkMark.lineWidth = 10
        checkMark.zPosition = 10
        checkMark.position = CGPoint(x: colorView.bounds.midX - 25, y: colorView.bounds.midY + 10)
        checkMark.transform = CATransform3DMakeRotation(CGFloat(-45 * (Double.pi / 180)), 0, 0, 1.0)
        colorView.layer.addSublayer(checkMark)
        
    }
    
    
    
    @IBAction func stopAnimationsTapped(_ sender: Any) {
        //animating the completion of the circle
        
        self.endAnimations() {
            //at this point, the circle should already be connected
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                //thinning out the width of the circle and removing the transparent layers
                
                let strokeWidth = CABasicAnimation()
                strokeWidth.keyPath = #keyPath(CAShapeLayer.lineWidth)
                strokeWidth.toValue = 0
                strokeWidth.duration = 0.7
                self.baseView.layer.sublayers![2].add(strokeWidth, forKey: "shrinkWidth")
                
                
                self.removeTransparentLayers {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.65, execute: {
                        //removing the base view circle (the layers of the circle)
                        //this includes all the animations from the inital animations
                        self.baseView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            
                        UIView.animate(withDuration: 0.4, delay: 0, options: [], animations: {
                            //shrinking the base view(which is transparent) so that the green circle underneath can be shown
                            self.baseView.frame = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                            self.baseView.layer.cornerRadius = 0
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                                let checkRotation = CABasicAnimation()
                                checkRotation.keyPath = #keyPath(CAShapeLayer.transform)
                                checkRotation.toValue = CATransform3DMakeRotation(CGFloat(35 * (Double.pi / 180)), 0, 0, 1.0)
                                checkRotation.duration = 0.15
                                
                                
                                self.colorView.layer.add(checkRotation, forKey: "checkRotation")
                            })
                            
                        }, completion: { (bool) in
                        
                            
                           
                            UIView.animate(withDuration: 0.5, delay: 0.8, options: [], animations: {
                                
                                self.colorView.alpha = 0
                            }, completion: { (bool) in
                                self.baseView.removeFromSuperview()
                                self.colorView.removeFromSuperview()
                                return
                            })
                            
                            return
                        })
                        
                    })
                }
            }
        
        }
    }
    
    
    
    
}
