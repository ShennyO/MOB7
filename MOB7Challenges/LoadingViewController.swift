//
//  LoadingViewController.swift
//  MOB7Challenges
//
//  Created by Sunny Ouyang on 5/17/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //not showing up because i forgot to call the function
        createLoadingAnimation()
        // Do any additional setup after loading the view.
    }
    
    

    func createLoadingAnimation() {
        
        //MARK: CREATING THE BASE VIEW
        
        //first thing we want to do is create a base view in the middle of the screen
        let baseFrame = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: self.view.bounds.width * 0.4, height: self.view.bounds.width * 0.4)
        let baseView = UIView(frame: baseFrame)
        //center rearranges the center point of our view
        baseView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        baseView.layer.cornerRadius = baseFrame.width / 2
        self.view.addSubview(baseView)
        
        //if I want to draw the triangle, or arrows, would I add extra points to the bezier curves?
        //Would I have to customly make my bezier curves to include the triangle in the end?
        //instead of using OvalIn, I think I have to make my bezier curves manually
        //I think we can just add the triangle manually within the circular bezier path we have
        
        
        
        //MARK: CREATING THE CIRCULAR BEZIER PATH
        let circleWidthHeight = baseFrame.width
        let path = UIBezierPath(ovalIn: CGRect(x: -circleWidthHeight / 2, y: -circleWidthHeight / 2, width: circleWidthHeight, height: circleWidthHeight))
        
    
//        MARK: CREATING OUR CASHAPELAYERS
        let layerOne = CAShapeLayer()
        layerOne.position = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
        layerOne.path = path.cgPath
        layerOne.fillColor = UIColor.clear.cgColor
        layerOne.strokeColor = UIColor.blue.cgColor
        layerOne.lineWidth = 10
        layerOne.strokeStart = 0
        layerOne.strokeEnd = 0.4
        
        //positions of our sublayer's aren't centered to its view
        //To position it in the middle, we have to have the circle's x & y equal to the negative of our circle's width divided by two
        
        let layerTwo = CAShapeLayer()
        layerTwo.position = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
        layerTwo.path = path.cgPath
        layerTwo.fillColor = UIColor.clear.cgColor
        layerTwo.strokeColor = UIColor.red.cgColor
        layerTwo.lineWidth = 10
        layerTwo.strokeStart = 0.5
        layerTwo.strokeEnd = 0.9

        baseView.layer.addSublayer(layerOne)
        baseView.layer.addSublayer(layerTwo)
        
    }

}
