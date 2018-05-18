//
//  ViewController.swift
//  MOB7Challenges
//
//  Created by Sunny Ouyang on 5/6/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        createRedView()
//        createChessBoardView()
//        createRainbowView()
//        createMirageView()
//        createPatternView()
//        setUpBezierLayer()
        createCirclesWithShadowLayer()
//        createGradientLayer()
//        createCustomNumberButton()
//        createViewAnimationOne()
//        createAnimationsWithBounce()
//        createAnimationsWithBounceAndLabels()
//        createRedViewAnimation()
//        createSpinningSquares()
//        loadingAnimation()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        createGradientLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createRedView() {
        let viewHeight = self.view.bounds.size.height
        let viewWidth = self.view.bounds.size.width
        let viewRectFrame = CGRect(x: 20, y: 20, width: viewWidth - 40, height: viewHeight - 40)
        let view = UIView(frame: viewRectFrame)
        view.backgroundColor = UIColor.red
        self.view.addSubview(view)
    }
    
    
    func createChessBoardView() {
        let baseViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width)
        let baseView = UIView(frame: baseViewFrame)
        baseView.center = self.view.center
        baseView.layer.borderWidth = 5
        baseView.layer.borderColor = UIColor.black.cgColor
        baseView.layer.zPosition = 2
        self.view.addSubview(baseView)
        let manager = ChessBoardManager(ViewController: self)

        for _ in 1...8 {
            for _ in 1...8 {
                manager.createTilesView(passedView: baseView)
            }
        }
    }
    
    func createRainbowView() {
        let hexColors = [0xF90f01, 0xFA8001, 0xFFFF00, 0x80FF01, 0x48FF00, 0x47FF7F, 0x0880FF, 0x0001FF, 0x8101FF, 0xF800D5, 0xF90D55, 0xF90F01]
        
        let viewHeight = self.view.bounds.size.height / 12
        let viewWidth = self.view.bounds.size.width
        
        for x in 0...11 {
            let viewYPosition = CGFloat(x) * viewHeight
            let viewFrame = CGRect(x: 0, y: viewYPosition, width: viewWidth, height: viewHeight)
            let view = UIView(frame: viewFrame)
            view.backgroundColor = UIColor(rgb: hexColors[x])
            self.view.addSubview(view)
        }
    }
    
    func createMirageView() {
        for i in 0...6 {
            let viewHeight = self.view.bounds.size.height
            let viewWidth = self.view.bounds.size.width
            let viewFrame = CGRect(x: 20 + 20 * CGFloat(i) , y: 20 + 20 * CGFloat(i) , width: viewWidth - 40 - (40 * CGFloat(i)), height: viewHeight - 40 - (40 * CGFloat(i)))
            let mirageView = UIView(frame: viewFrame)
            let color = UIColor.init(hue: 1 - CGFloat(CGFloat(i) * 0.1), saturation: 1 - CGFloat(CGFloat(i) * 0.2), brightness: 1, alpha: 1)
            mirageView.backgroundColor = color
            self.view.addSubview(mirageView)
        }
    }
    
    func createPatternView() {
        //PatternView
        let viewHeight = self.view.bounds.size.height
        let viewWidth = self.view.bounds.size.width
        let viewFrame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        let patternView = UIView(frame: viewFrame)
        patternView.backgroundColor = UIColor(patternImage: UIImage(named: "asanaPattern")!)
        self.view.addSubview(patternView)
        
        //Black Squares
        var rowCounter = 0
        var columnCounter = 0
        let blackSquareWidth = (viewWidth - 60) / 2
        let blackSquareHeight = blackSquareWidth
        for _ in 0...5 {
            let squarePosition = CGPoint(x: 20 + CGFloat(20 * columnCounter) + CGFloat(columnCounter) * (blackSquareWidth), y: 20 + CGFloat(20 * rowCounter) + CGFloat(rowCounter) * (blackSquareHeight))
            let squareRect = CGRect(x: squarePosition.x, y: squarePosition.y, width: blackSquareWidth, height: blackSquareHeight)
            let square = UIView(frame: squareRect)
            square.backgroundColor = UIColor.black
            self.view.addSubview(square)
            columnCounter += 1
            if columnCounter == 2 {
                rowCounter += 1
                columnCounter = 0
            }
        }
        
    }
    
    func createGradientLayer() {
        let startingColor = UIColor(red: 252, green: 217, blue: 97).cgColor
        let endingColor = UIColor(red: 247, green: 107, blue: 28).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        self.view.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [startingColor, endingColor]
    }
    
    func createBezierPath() -> UIBezierPath {
        // my problem was that i was using the .move, when you use .move, it cancels the current path being created and instead starts a new path, which you can't close
        
        let bezierPath = UIBezierPath()
        let startingPoint = CGPoint(x: self.view.bounds.minX, y: self.view.bounds.midY)
        bezierPath.move(to: startingPoint)
        let controlPoint1 = CGPoint(x: self.view.bounds.midX / 2, y: startingPoint.y)
        let controlPoint2 = CGPoint(x: self.view.bounds.midX / 2, y: self.view.bounds.height / 2 + 100)
        let midPoint = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY + 100)
        bezierPath.addCurve(to: midPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        let endPoint = CGPoint(x: self.view.bounds.maxX, y: self.view.bounds.midY - 50)
        let controlPoint3 = CGPoint(x: self.view.bounds.maxX - (self.view.bounds.midX / 2), y: startingPoint.y + 100)
        let controlPoint4 = CGPoint(x: self.view.bounds.maxX - (self.view.bounds.midX / 2) - 50, y: startingPoint.y - 100)
        bezierPath.addCurve(to: endPoint, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        let bottomEndPoint = CGPoint(x: self.view.bounds.maxX , y: self.view.bounds.maxY)
        bezierPath.addLine(to: bottomEndPoint)
        let bottomBeginPoint = CGPoint(x: self.view.bounds.minX, y: self.view.bounds.maxY)
        bezierPath.addLine(to: bottomBeginPoint)
        bezierPath.close()
        
        return bezierPath
    }
    
    func createBezierPath2() -> UIBezierPath {
        // my problem was that i was using the .move, when you use .move, it cancels the current path being created and instead starts a new path, which you can't close
        
        let bezierPath = UIBezierPath()
        let startingPoint = CGPoint(x: self.view.bounds.minX, y: self.view.bounds.midY)
        bezierPath.move(to: startingPoint)
        let controlPoint1 = CGPoint(x: self.view.bounds.midX / 2, y: startingPoint.y)
        let controlPoint2 = CGPoint(x: self.view.bounds.midX / 2, y: self.view.bounds.height / 2 + 130)
        let midPoint = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY + 130)
        bezierPath.addCurve(to: midPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        let endPoint = CGPoint(x: self.view.bounds.maxX, y: self.view.bounds.midY - 20)
        let controlPoint3 = CGPoint(x: self.view.bounds.maxX - (self.view.bounds.midX / 2), y: startingPoint.y + 130)
        let controlPoint4 = CGPoint(x: self.view.bounds.maxX - (self.view.bounds.midX / 2) - 10, y: startingPoint.y - 70)
        bezierPath.addCurve(to: endPoint, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        let bottomEndPoint = CGPoint(x: self.view.bounds.maxX , y: self.view.bounds.maxY)
        bezierPath.addLine(to: bottomEndPoint)
        let bottomBeginPoint = CGPoint(x: self.view.bounds.minX, y: self.view.bounds.maxY)
        bezierPath.addLine(to: bottomBeginPoint)
        bezierPath.close()
        
        return bezierPath
    }
    
    func setUpBezierLayer() {
        let bezierLayer = CAShapeLayer()
        let circleLayer = CAShapeLayer()
        bezierLayer.path = createBezierPath().cgPath
        bezierLayer.fillColor = UIColor.orange.cgColor
        self.view.layer.addSublayer(bezierLayer)
        let bezierLayer2 = CAShapeLayer()
        bezierLayer2.path = createBezierPath2().cgPath
        bezierLayer2.fillColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(bezierLayer2)
        
        
        let circleX = (self.view.bounds.width / 2) + self.view.bounds.width / 4
        let circleY = CGFloat(50)
        let rect = CGRect(x: circleX, y: circleY, width: 75, height: 75)
        let circlePath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height / 2).cgPath
        circleLayer.path = circlePath
        circleLayer.fillColor = UIColor.orange.cgColor
        self.view.layer.addSublayer(circleLayer)
    }
    
    
    func createCirclesWithShadowLayer() {

        let circleView = ringedCircle(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        circleView.layer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        self.view.addSubview(circleView)
        
    }
    
    func createCustomNumberButton() {
        self.createGradientLayer()
        let button = customNumberButton(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        button.layer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        self.view.addSubview(button)
    }
    
    func createViewAnimationOne() {
        let insetDistance = self.view.bounds.width * 0.25
        let animationViewsWidthHeight = (self.view.bounds.width - insetDistance) / 5
        let startingPoint = insetDistance / 2
        for i in 0...4 {
            let viewFrame = CGRect(x: startingPoint + (animationViewsWidthHeight * CGFloat(i)), y: self.view.bounds.maxY, width: animationViewsWidthHeight, height: animationViewsWidthHeight)
            let colorView = UIView(frame: viewFrame)
            colorView.backgroundColor = UIColor(hue: 0 + (CGFloat(0.04) * CGFloat(i)), saturation: 1, brightness: 1, alpha: 1)
            self.view.addSubview(colorView)
            
            let labelFrame = CGRect(x: colorView.bounds.midX, y: colorView.bounds.midY, width: colorView.bounds.width * 0.4, height: colorView.bounds.height * 0.4)
            let label = UILabel(frame: labelFrame)
                        label.layer.position = CGPoint(x: colorView.bounds.midX, y: colorView.bounds.midY)
            label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.text = "\(i + 1)"
            
            colorView.addSubview(label)
            
            let delay = 0.25 + (CGFloat(i) * CGFloat(0.25))
            UIView.animateKeyframes(withDuration: 0.5, delay: TimeInterval(delay), options: [], animations: {
                colorView.frame = CGRect(x: startingPoint + (animationViewsWidthHeight * CGFloat(i)), y: self.view.bounds.maxY - animationViewsWidthHeight, width: animationViewsWidthHeight, height: animationViewsWidthHeight)
            }, completion: { (bool) in
                return bool
            })
        }
    }
    
    func createAnimationsWithBounce() {
        let insetDistance = self.view.bounds.width * 0.25
        let animationViewsWidthHeight = (self.view.bounds.width - insetDistance) / 5
        let startingPoint = insetDistance / 2
        for i in 0...4 {
            let viewFrame = CGRect(x: startingPoint + (animationViewsWidthHeight * CGFloat(i)), y: self.view.bounds.maxY, width: animationViewsWidthHeight, height: animationViewsWidthHeight)
            let colorView = UIView(frame: viewFrame)
            colorView.backgroundColor = UIColor(hue: 0 + (CGFloat(0.04) * CGFloat(i)), saturation: 1, brightness: 1, alpha: 1)
            self.view.addSubview(colorView)
            
            let labelFrame = CGRect(x: colorView.bounds.midX, y: colorView.bounds.midY, width: colorView.bounds.width * 0.4, height: colorView.bounds.height * 0.4)
            let label = UILabel(frame: labelFrame)
            label.layer.position = CGPoint(x: colorView.bounds.midX, y: colorView.bounds.midY)
            label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.text = "\(i + 1)"
            
            colorView.addSubview(label)
            
            let delay = 0.25 + (CGFloat(i) * CGFloat(0.25))
            UIView.animate(withDuration: 0.5, delay: TimeInterval(delay), usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
                colorView.frame = CGRect(x: startingPoint + (animationViewsWidthHeight * CGFloat(i)), y: self.view.bounds.maxY - animationViewsWidthHeight, width: animationViewsWidthHeight, height: animationViewsWidthHeight)
            }, completion: { (bool) in
                return bool
            })
        }
    }
    
    
    
    func createAnimationsWithBounceAndLabels() {
        
        // CREATING THE VIEWS
        let insetDistance = self.view.bounds.width * 0.25
        let animationViewsWidthHeight = (self.view.bounds.width - insetDistance) / 5
        let startingPoint = insetDistance / 2
        for i in 0...4 {
            let viewFrame = CGRect(x: startingPoint + (animationViewsWidthHeight * CGFloat(i)), y: self.view.bounds.maxY, width: animationViewsWidthHeight, height: animationViewsWidthHeight)
            let colorView = UIView(frame: viewFrame)
            colorView.backgroundColor = UIColor(hue: 0 + (CGFloat(0.04) * CGFloat(i)), saturation: 1, brightness: 1, alpha: 1)
            self.view.addSubview(colorView)
            
            let labelFrame = CGRect(x: colorView.bounds.midX, y: colorView.bounds.midY, width: colorView.bounds.width * 0.4, height: colorView.bounds.height * 0.4)
            let label = UILabel(frame: labelFrame)
            label.layer.position = CGPoint(x: colorView.bounds.midX, y: colorView.bounds.midY)
            label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.text = "\(i + 1)"
            
            colorView.addSubview(label)
            
            let delay = 0.25 + (CGFloat(i) * CGFloat(0.25))
            UIView.animate(withDuration: 0.5, delay: TimeInterval(delay), usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
                colorView.frame = CGRect(x: startingPoint + (animationViewsWidthHeight * CGFloat(i)), y: self.view.bounds.maxY - animationViewsWidthHeight, width: animationViewsWidthHeight, height: animationViewsWidthHeight)
            }, completion: { (bool) in
                return bool
            })
        }
        
        //Creating subtitle text label
        let labelWidth = self.view.bounds.width - insetDistance
        let subtitleFrame = CGRect(x: startingPoint, y: self.view.bounds.maxY - animationViewsWidthHeight - (self.view.bounds.height * 0.04), width: labelWidth, height: self.view.bounds.height * 0.04)
        let subtitleLabel = UILabel(frame: subtitleFrame)
        subtitleLabel.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        subtitleLabel.alpha = 0.0
        subtitleLabel.text = "subtitles"
        subtitleLabel.textAlignment = .right
        self.view.addSubview(subtitleLabel)
        
        UIView.animate(withDuration: 2.0, delay: TimeInterval(2.5), options: [], animations: {
            subtitleLabel.alpha = 1.0
        }) { (bool) in
            return bool
        }
        
        
        //creating bold text label
        let boldTextFrame = CGRect(x: startingPoint, y: self.view.bounds.maxY - animationViewsWidthHeight - (self.view.bounds.height * 0.08), width: labelWidth, height: self.view.bounds.height * 0.04)
        let boldTextLabel = UILabel(frame: boldTextFrame)
        boldTextLabel.backgroundColor = UIColor.gray
        boldTextLabel.alpha = 0
        boldTextLabel.text = "Bold Label"
        boldTextLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        boldTextLabel.textAlignment = .left
        self.view.addSubview(boldTextLabel)
        
        UIView.animate(withDuration: 1.0, delay: TimeInterval(1.5), options: [], animations: {
            boldTextLabel.alpha = 1.0
        }) { (bool) in
            return bool
        }
        
        //creating gradient View
        
        
        let gradientLayer = CAGradientLayer()
        
        let gradientFrame = CGRect(x: startingPoint, y: self.view.bounds.maxY - animationViewsWidthHeight - (self.view.bounds.height * 0.08) - 3, width: 0, height: 3)
        let gradientView = UIView(frame: gradientFrame)
        gradientView.backgroundColor = UIColor.clear
        gradientView.clipsToBounds = true
        
        self.view.addSubview(gradientView)
    
        gradientLayer.frame = gradientView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
        
        UIView.animate(withDuration: 1, delay: TimeInterval(3.5), options: [], animations: {
            gradientView.frame = CGRect(x: startingPoint, y: self.view.bounds.maxY - animationViewsWidthHeight - (self.view.bounds.height * 0.08) - 2, width: labelWidth, height: 3)
            gradientLayer.frame = gradientView.bounds
        }) { (bool) in
            return bool
        }
    }
    
    func animateSquare(frame1: CGRect, frame2: CGRect, delay: TimeInterval) {
        let squareWidthHeight = (self.view.bounds.width - 90 / 2)
        let frame1 = frame1
        let squareOne = UIView(frame: frame1)
        squareOne.alpha = 0
        squareOne.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        squareOne.transform = CGAffineTransform(rotationAngle: 90)
        self.view.addSubview(squareOne)
        
        UIView.animate(withDuration: 0.25, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            squareOne.transform = CGAffineTransform(rotationAngle: 0)
            squareOne.alpha = 1
            squareOne.bounds = CGRect(x: 30, y: 30, width: squareWidthHeight, height: squareWidthHeight)
            squareOne.frame = frame2
        }) { (bool) in
            return bool
        }
    }
    
    func createSpinningSquares() {
        let squareWidthHeight = (self.view.bounds.width - 90 ) / 2
        var squareCounter = 0
        var delay: Double = 0.25
        let smallSquareframes: [CGRect] = [CGRect(x: 30, y: 30, width: 50, height: 50), CGRect(x: 60 + squareWidthHeight, y: 30, width: 50, height: 50), CGRect(x: 30, y: 60 + squareWidthHeight, width: 50, height: 50), CGRect(x: 60 + squareWidthHeight, y: 60 + squareWidthHeight, width: 50, height: 50), CGRect(x: 30, y: 90 + (squareWidthHeight * 2), width: 50, height: 50), CGRect(x: 60 + squareWidthHeight, y: 90 + (squareWidthHeight * 2), width: 50, height: 50)]
        
        
        
        let bigSquareFrames: [CGRect] = [CGRect(x: 30, y: 30, width: squareWidthHeight, height: squareWidthHeight), CGRect(x: 60 + squareWidthHeight, y: 30, width: squareWidthHeight, height: squareWidthHeight), CGRect(x: 30, y: 60 + squareWidthHeight, width: squareWidthHeight, height: squareWidthHeight), CGRect(x: 60 + squareWidthHeight, y: 60 + squareWidthHeight, width: squareWidthHeight, height: squareWidthHeight), CGRect(x: 30, y: 90 + (squareWidthHeight * 2), width: squareWidthHeight, height: squareWidthHeight), CGRect(x: 60 + squareWidthHeight, y: 90 + (squareWidthHeight * 2), width: squareWidthHeight, height: squareWidthHeight)]
        
        
        for i in 0...5 {
            animateSquare(frame1: smallSquareframes[i], frame2: bigSquareFrames[i], delay: delay)
            delay += 0.25
        }
        
    }
    
    
    
    
    func createRedViewAnimation() {
        
        //Creating original red View
        
        let viewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height).insetBy(dx: 20, dy: 20)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 10
        self.view.addSubview(view)
        
        //animate the frame and animate the corner radius
        let frameTwo = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 45, height: 45)
        
        UIView.animate(withDuration: 0.75, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
            view.frame = frameTwo
            view.layer.cornerRadius = frameTwo.height / 2
            view.layer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        }) { (bool) in
            return bool
        }
        
        //animate the y position and height of the view
        let frameThree = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY - 150, width: 45, height: 75)
        
        UIView.animate(withDuration: 0.75, delay: 1.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            view.frame = frameThree
            view.layer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY - 150)
        }) { (bool) in
            return bool
        }
        
        //animate the width of the view (we can use insets)
        UIView.animate(withDuration: 1, delay: 2.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: [], animations: {
            view.frame = view.frame.insetBy(dx: -100, dy: 0)
        }) { (bool) in
            return bool
        }
        
        //animate the height of the view
        UIView.animate(withDuration: 1, delay: 3.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: [], animations: {
            view.frame = view.frame.insetBy(dx: 0, dy: -100)
            view.layer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY - 50)
        }) { (bool) in
            return bool
        }
        
        //animate to the blue ball
        let frameFour = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY - 150, width: 45, height: 45)
        
        UIView.animate(withDuration: 0.6, delay: 4.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            view.frame = frameFour
            view.layer.cornerRadius = frameFour.height / 2
            view.layer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY - 150)
            view.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        }) { (bool) in
            return bool
        }
        
    }
    
        
    
    
    func loadingAnimation() {
        
        //Create the View to place the layers on
        
        let viewFrame = CGRect(x: 0, y: 0, width: 800, height: 500)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = UIColor.white
        self.view.addSubview(view)
        
        //Creating the shape layer
        
        let shape = CAShapeLayer()
        
        //Create the BezierPath, the curvy lines that our shape layer adheres to
        
        let path = UIBezierPath()
        
        let point0 = CGPoint(x: 0, y: 350)
        let point1 = CGPoint(x: 200, y: 250)
        let point2 = CGPoint(x: 550, y: 400)
        let point3 = CGPoint(
            x: viewFrame.maxX,
            y: point2.y - 100
        )
        
        let control0 = CGPoint(x: point0.x + 60, y: point0.y)
        
        let control1 = CGPoint(x: point1.x - 110, y: point1.y)
        
        let control2 = CGPoint(x: point1.x + 110, y: point1.y)
        let control3 = CGPoint(x: point2.x - 110, y: point2.y)
        let control4 = CGPoint(x: point2.x + 120, y: point2.y)
        let control5 = CGPoint(x: point3.x - 100, y: point3.y)
        
        
        path.move(to: point0)
        path.addCurve(to: point1, controlPoint1: control0, controlPoint2: control1)
        path.addCurve(to: point2, controlPoint1: control2, controlPoint2: control3)
        path.addCurve(to: point3, controlPoint1: control4, controlPoint2: control5)
        
        //Draw the actual shape of the shapelayer
        
        shape.path = path.cgPath
        //the stroke color actually gets animated
        shape.strokeColor = UIColor.red.cgColor
        shape.lineWidth = 5
        shape.strokeStart = 0
        shape.strokeEnd = 0.1
        shape.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(shape)
        
        
//        let strokeStartAnim = CABasicAnimation()
//        strokeStartAnim.toValue = 0.7
//        strokeStartAnim.repeatCount = 100
//        strokeStartAnim.keyPath = #keyPath(CAShapeLayer.strokeStart)
//        strokeStartAnim.duration = 5
//        strokeStartAnim.beginTime = 0
//        strokeStartAnim.speed = 1
//        shape.add(strokeStartAnim, forKey: "startAnim")

        let strokeEndAnim = CABasicAnimation()
        strokeEndAnim.toValue = 1
        strokeEndAnim.repeatCount = Float(Int.max)
        strokeEndAnim.keyPath = #keyPath(CAShapeLayer.strokeEnd)
        strokeEndAnim.duration = 5
        strokeEndAnim.beginTime = 0
        strokeEndAnim.speed = 1
        shape.add(strokeEndAnim, forKey: "endAnim")
    

//        let groupAnim = CAAnimationGroup()
//        groupAnim.animations = [strokeStartAnim, strokeEndAnim]
//        groupAnim.duration = 3.5
//        groupAnim.beginTime = 0
//        groupAnim.speed = 1
//        groupAnim.autoreverses = true
//        groupAnim.repeatCount = .greatestFiniteMagnitude
//        shape.add(groupAnim, forKey: "groupAnimation")
//
//        let trackLayer = CAShapeLayer()
//        trackLayer.fillColor = UIColor.blue.cgColor
//        trackLayer.backgroundColor = UIColor.blue.cgColor
//        trackLayer.frame = CGRect(origin: point0, size: CGSize(width: 12, height: 8))
        
//        let keyFrameAnim = CAKeyframeAnimation()
//        keyFrameAnim.path = path.cgPath
//        keyFrameAnim.keyPath = #keyPath(CAShapeLayer.position)
//        keyFrameAnim.isRemovedOnCompletion = true
//        keyFrameAnim.duration = 3
//        keyFrameAnim.calculationMode = kCAAnimationLinear
//        keyFrameAnim.repeatCount = Float(Int.max)
//        trackLayer.add(keyFrameAnim, forKey: "keyframe")
//        shape.addSublayer(trackLayer)
    }
    
    
    
}

//keep track of all the components we need to create the chess board
class ChessBoardManager {
    
    //keep track of the rows to know when to reset the coordinates
    var rowCounter: CGFloat = 0
    //keep track of the column index
    var columnCounter: CGFloat = 0
    var viewController: UIViewController
    var isBlack: Bool = false
    
    
    init(ViewController: UIViewController) {
        self.viewController = ViewController
    }
    
    
    //returns the color && switches the current color
    func tileColor() -> UIColor {
        switch isBlack {
        case false:
            isBlack = !isBlack
            print("white || column: \(columnCounter) row: \(rowCounter)")
            return UIColor.white
        case true:
            print("black || column: \(columnCounter) row: \(rowCounter)")
            isBlack = !isBlack
            return UIColor.red
        }
        
    }
    
    // returns the position of the current tile
    func tilePosition(column: CGFloat, row: CGFloat) -> CGPoint {
        
        let y = row * (viewController.view.bounds.size.width / 8)
        let x = column * (viewController.view.bounds.size.width / 8)
        
        return CGPoint(x: x, y: y)
        
    }
    
    func createTilesView(passedView: UIView) {
        let position = tilePosition(column: columnCounter, row: rowCounter)
        let tileRect = CGRect(x: position.x, y: position.y, width: viewController.view.bounds.width / 8, height: viewController.view.bounds.width / 8)
        let tileView = UIView(frame: tileRect)
        tileView.backgroundColor = tileColor()
        passedView.addSubview(tileView)
        //after we added our view, we want to reset the positions
        
        if columnCounter == 7 {
            columnCounter = 0
            rowCounter += 1
            isBlack = !isBlack
        } else {
            columnCounter += 1
        }
        
    }
    
}

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

