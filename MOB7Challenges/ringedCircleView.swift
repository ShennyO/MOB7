//
//  ringedCircleView.swift
//  MOB7Challenges
//
//  Created by Sunny Ouyang on 5/11/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import Foundation
import UIKit

class ringedCircle: UIView {
    
    lazy var innerCircle: CAShapeLayer = {
        let circleHeight = self.bounds.height * 0.55
        let circleWidth = self.bounds.width * 0.55
        let circle = CAShapeLayer()
        circle.strokeColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        circle.position = self.center
        circle.fillColor = UIColor.red.cgColor
        circle.path = UIBezierPath(ovalIn: CGRect(x: -circleWidth / 2, y: -circleHeight / 2, width: circleWidth, height: circleHeight)).cgPath
        return circle
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = frame.height / 2
        self.layer.addSublayer(innerCircle)
        self.layer.borderWidth = self.bounds.width * 0.1
        self.layer.borderColor = UIColor.white.cgColor
        
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
