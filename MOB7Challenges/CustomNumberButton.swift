//
//  CustomNumberButton.swift
//  MOB7Challenges
//
//  Created by Sunny Ouyang on 5/11/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import Foundation
import UIKit

class customNumberButton: UIView {
    
    var textValue: Int = 5
    
    lazy var numberText: UILabel = {
        let labelWidthHeight = self.bounds.width * 0.35
        let labelFrame = CGRect(x: 0, y: 0, width: labelWidthHeight, height: labelWidthHeight)
        let label = UILabel(frame: labelFrame)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: labelWidthHeight)
        label.frame.origin = self.bounds.origin
        label.center = self.convert(self.center, from: label)
        label.textAlignment = .center
        label.text = "\(textValue)"
        return label
        
    }()
    
    lazy var minusText: UILabel = {
        let labelWidthHeight = self.leftCircle.bounds.width * 0.55
        let labelFrame = CGRect(x: 0, y: 0, width: labelWidthHeight, height: labelWidthHeight)
        let label = UILabel(frame: labelFrame)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: labelWidthHeight)
        label.center = CGPoint(x: self.leftCircle.bounds.width / 2, y: self.leftCircle.bounds.height / 2 - (self.leftCircle.bounds.height * 0.05))
        label.textAlignment = .center
        label.text = "-"
        return label
    }()
    
    lazy var plusText: UILabel = {
        let labelWidthHeight = self.rightCircle.bounds.width * 0.55
        let labelFrame = CGRect(x: 0, y: 0, width: labelWidthHeight, height: labelWidthHeight)
        let label = UILabel(frame: labelFrame)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: labelWidthHeight)
        label.center = CGPoint(x: self.leftCircle.bounds.width / 2, y: self.rightCircle.bounds.height / 2 - (self.rightCircle.bounds.height * 0.05))
        label.textAlignment = .center
        label.text = "+"
        return label
    }()
    
    lazy var middleCircle: UIView = {
        let rect = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        let view = UIView(frame: rect)
        view.layer.cornerRadius = rect.height / 2
        view.layer.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        view.layer.borderWidth = 14
        
        return view
    }()
    
    lazy var leftCircle: UIView = {
       let rect = CGRect(x: 0, y: 0, width: self.bounds.width * 0.4, height: self.bounds.height * 0.4)
        let view = UIView(frame: rect)
        view.layer.cornerRadius = rect.height / 2
        view.frame.origin = self.middleCircle.bounds.origin
        view.layer.anchorPoint = CGPoint(x: 0.35, y: 0.5)
        view.center = CGPoint(x: self.middleCircle.bounds.minX, y: self.middleCircle.bounds.midY)
        view.layer.borderWidth = 12
        return view
    }()
    
    lazy var rightCircle: UIView = {
        let rect = CGRect(x: 0, y: 0, width: self.bounds.width * 0.4, height: self.bounds.height * 0.4)
        let view = UIView(frame: rect)
        view.layer.cornerRadius = rect.height / 2
        view.frame.origin = self.middleCircle.bounds.origin
        view.layer.anchorPoint = CGPoint(x: 0.65, y: 0.5)
        view.center = CGPoint(x: self.middleCircle.bounds.maxX, y: self.middleCircle.bounds.midY)
        view.layer.borderWidth = 12
        
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(middleCircle)
        self.addSubview(leftCircle)
        self.addSubview(rightCircle)
        middleCircle.layer.backgroundColor = UIColor(rgb: 0xD8D8D8).cgColor
        middleCircle.layer.borderColor = UIColor.gray.cgColor
        leftCircle.layer.borderColor = UIColor.gray.cgColor
        leftCircle.layer.backgroundColor =  UIColor(rgb: 0xD8D8D8).cgColor
        leftCircle.layer.zPosition = 2
        rightCircle.layer.borderColor = UIColor.gray.cgColor
        rightCircle.layer.backgroundColor =  UIColor(rgb: 0xD8D8D8).cgColor
        rightCircle.layer.zPosition = 2
        self.addSubview(numberText)
        self.leftCircle.addSubview(minusText)
        self.rightCircle.addSubview(plusText)
        
        let leftTap = UITapGestureRecognizer(target: self, action: #selector(self.leftCircleTapped))
        leftTap.delegate = self as? UIGestureRecognizerDelegate
        self.leftCircle.addGestureRecognizer(leftTap)
        
        let rightTap = UITapGestureRecognizer(target: self, action: #selector(self.rightCircleTapped))
        rightTap.delegate = self as? UIGestureRecognizerDelegate
        self.rightCircle.addGestureRecognizer(rightTap)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func leftCircleTapped() {
        self.textValue -= 1
        self.numberText.text = "\(textValue)"
        
    }
    
    @objc func rightCircleTapped() {
        self.textValue += 1
        self.numberText.text = "\(textValue)"
    }
    
}
