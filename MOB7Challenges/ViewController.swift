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
        setUpBezierLayer()
//        createCirclesWithShadowLayer()
        
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
        let manager = ChessBoardManager(ViewController: self)

        for _ in 1...8 {
            for _ in 1...8 {
                manager.createTilesView()
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
            return UIColor.black
        }
        
    }
    
    // returns the position of the current tile
    func tilePosition(column: CGFloat, row: CGFloat) -> CGPoint {
        
        let y = row * (viewController.view.bounds.size.width / 8)
        let x = column * (viewController.view.bounds.size.width / 8)
        
        return CGPoint(x: x, y: y)
        
    }
    
    func createTilesView() {
        let position = tilePosition(column: columnCounter, row: rowCounter)
        let tileRect = CGRect(x: position.x, y: position.y, width: viewController.view.bounds.width / 8, height: viewController.view.bounds.width / 8)
        let tileView = UIView(frame: tileRect)
        tileView.backgroundColor = tileColor()
        viewController.view.addSubview(tileView)
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

