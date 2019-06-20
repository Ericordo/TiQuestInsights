//
//  WeekNumberLabel.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 29/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class WeekNumberLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
//    let bottomLineSeparator : CALayer = {
//    let bottomLineSeparator = CALayer()
//    bottomLineSeparator.backgroundColor = UIColor.lightGray.cgColor
//    return bottomLineSeparator
//    }()
    
    func setUpLabel() {
//        bottomLineSeparator.frame = CGRect(x: 0, y: self.frame.height-0.5, width: self.frame.width, height: 0.5)
//        self.layer.addSublayer(bottomLineSeparator)
        self.text = "W\(weekNumber)"
        self.textColor = .lightGray
        self.textAlignment = .center
        
    }
    
    

   

}

extension WeekNumberLabel : WeekNumberUpdateDelegate {
    func updateWeekNumber(day: Int, month: Int, year: Int) {
        let components = DateComponents(year: year, month: month, day: day)
        guard let selectedDate = calendar.date(from: components) else { return }
        let selectedWeekNumber = calendar.component(.weekOfYear, from: selectedDate)
        print("newWeekNumber \(selectedWeekNumber)")
        self.text = "W\(selectedWeekNumber)"
    }
    
//    func updateWeekNumber() {
//        let components = DateComponents(year: year, month: month, day: day, yearForWeekOfYear: yearForWeekNumber)
//        guard let selectedDate = calendar.date(from: components) else { return }
//        let newWeekNumber = calendar.component(.weekOfYear, from: selectedDate)
//        print(newWeekNumber)
//
//    }
    
    
}
