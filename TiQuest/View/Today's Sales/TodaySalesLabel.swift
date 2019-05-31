//
//  TodaySalesLabel.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 23/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

func  customizeColor(string: String, color: UIColor) -> NSMutableAttributedString {
    return NSMutableAttributedString(string: string, attributes:
        [NSAttributedString.Key.foregroundColor : color ])
}


class TodaySalesLabel: NSObject {
    override init() {
        super.init()
    }
    

    
    
    let todaySalesLabel : UILabel = {
        let label = UILabel()
        var value = 3500
//        var litteralValue : NSString = "\(value)€"
//        var litteralValue = NSMutableAttributedString(string: "\(value)€", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 15)!, NSAttributedString.Key.foregroundColor: UIColor(cgColor: UIColor.black.cgColor)])
//        let description = NSMutableAttributedString(string: "Total sales", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 15)!, NSAttributedString.Key.foregroundColor: UIColor(cgColor: UIColor.lightGray.cgColor)])
        label.numberOfLines = 2
        label.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 0.5)
        
        let attrText = customizeColor(string: "\(value) €\n", color: UIColor.black)
        attrText.append(customizeColor(string: "Total sales", color: UIColor.lightGray))
        label.attributedText = attrText
        let horizontalEffect = UIInterpolatingMotionEffect(
            keyPath: "center.x",
            type: .tiltAlongHorizontalAxis)
        horizontalEffect.minimumRelativeValue = -16
        horizontalEffect.maximumRelativeValue = 16
        
        let verticalEffect = UIInterpolatingMotionEffect(
            keyPath: "center.y",
            type: .tiltAlongVerticalAxis)
        verticalEffect.minimumRelativeValue = -16
        verticalEffect.maximumRelativeValue = 16
        
        let effectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [ horizontalEffect,
                                      verticalEffect ]
        label.addMotionEffect(effectGroup)
        return label
    }()
    
    
    
    
    func updateLabel() {
        
    }
    
    func showTodaySalesLabel() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(todaySalesLabel)
            todaySalesLabel.frame = CGRect(x: 70, y: 130, width: 100, height: 50)
        }
        
    }


}


