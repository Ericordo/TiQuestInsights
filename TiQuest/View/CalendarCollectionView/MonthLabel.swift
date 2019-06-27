//
//  MonthLalbel.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 13/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class MonthLabel: UILabel {
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var currentMonth = String()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    let bottomLineSeparator : CALayer = {
//        let bottomLineSeparator = CALayer()
//        bottomLineSeparator.backgroundColor = UIColor.lightGray.cgColor
//        return bottomLineSeparator
//    }()
    
    func setUpLabel() {
//        bottomLineSeparator.frame = CGRect(x: 0, y: self.frame.height-0.5, width: self.frame.width, height: 0.5)
//        self.layer.addSublayer(bottomLineSeparator)
        self.adjustsFontSizeToFitWidth = true
        currentMonth = months[month]
//        self.text = "\(currentMonth)" + "\n" + "\(year)"
        self.text = "\(currentMonth)\n\(year)"
        self.textColor = .lightGray
        self.numberOfLines = 0
        self.sizeToFit()
        self.textAlignment = .center
    }
}

extension MonthLabel : MonthLabelUpdateDelegate {
    func updateSelectedMonth(month: String) {
        self.text = month
    }
    
   
    }
    
    


