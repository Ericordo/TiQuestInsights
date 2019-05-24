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
        label.backgroundColor = .white
        let attrText = customizeColor(string: "\(value) €\n", color: UIColor.black)
        attrText.append(customizeColor(string: "Total sales", color: UIColor.lightGray))
        label.attributedText = attrText
        return label
    }()
    
    
    func updateLabel() {
        
    }
    
    func showTodaySalesLabel() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(todaySalesLabel)
            todaySalesLabel.frame = CGRect(x: 50, y: 130, width: 100, height: 50)
        }
        
    }


}


