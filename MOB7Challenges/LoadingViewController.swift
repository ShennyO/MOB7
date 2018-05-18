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
        
        //Top triangle on the right side
        let topRightTriangle = UIBezierPath()
        let rtStartingPoint = CGPoint(x: baseView.bounds.maxX - (baseView.bounds.maxX * 0.2415), y: baseView.bounds.midY - (baseView.bounds.midY * 0.543))
        let rtPointTwo = CGPoint(x: baseView.bounds.maxX - (baseView.bounds.maxX * 0.06), y: baseView.bounds.midY - (baseView.bounds.midY * 0.8756))
        let rtPointThree = CGPoint(x: baseView.bounds.maxX - (baseView.bounds.maxX * 0.012), y: baseView.bounds.midY - (baseView.bounds.midY * 0.362))
        topRightTriangle.move(to: rtStartingPoint)
        topRightTriangle.addLine(to: rtPointTwo)
        topRightTriangle.addLine(to: rtPointThree)
        topRightTriangle.close()
        
        //bottom triangle on the left side
        let bottomLeftTriangle = UIBezierPath()
        let ltStartingPoint = CGPoint(x: baseView.bounds.minX + (baseView.bounds.maxX * 0.2415), y: baseView.bounds.midY + (baseView.bounds.midY * 0.543))
        let ltPointTwo = CGPoint(x: baseView.bounds.minX + (baseView.bounds.maxX * 0.06), y: baseView.bounds.midY + (baseView.bounds.midY * 0.8756))
        let ltPointThree = CGPoint(x: baseView.bounds.minX + (baseView.bounds.maxX * 0.012), y: baseView.bounds.midY + (baseView.bounds.midY * 0.362))
        bottomLeftTriangle.move(to: ltStartingPoint)
        bottomLeftTriangle.addLine(to: ltPointTwo)
        bottomLeftTriangle.addLine(to: ltPointThree)
        bottomLeftTriangle.close()
        
        
        
        
    
//        MARK: CREATING OUR CASHAPELAYERS
        let triangleLayerOne = CAShapeLayer()
        triangleLayerOne.path = topRightTriangle.cgPath
        triangleLayerOne.strokeColor = UIColor.red.cgColor
        triangleLayerOne.fillColor = UIColor.red.cgColor
        
        let triangleLayerTwo = CAShapeLayer()
        triangleLayerTwo.path = bottomLeftTriangle.cgPath
        triangleLayerTwo.strokeColor = UIColor.blue.cgColor
        triangleLayerTwo.fillColor = UIColor.blue.cgColor
        
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
        baseView.layer.addSublayer(triangleLayerOne)
        baseView.layer.addSublayer(triangleLayerTwo)
        
    }

}
