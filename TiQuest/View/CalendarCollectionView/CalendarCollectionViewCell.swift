//
//  CalendarCollectionViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? UIColor.red : UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        }
    }
    
    
 let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
        }()
    
    
    func setUpCell() {
        
//        let lineSeparator = CALayer()
//        lineSeparator.frame = CGRect(x: self.frame.width, y: 0, width: 0.5, height: self.frame.height)
//        lineSeparator.backgroundColor = UIColor.lightGray.cgColor
//        layer.addSublayer(lineSeparator)
        self.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        self.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        let bottomLineSeparator = CALayer()
        bottomLineSeparator.frame = CGRect(x: 0, y: self.frame.height-0.5, width: self.frame.width, height: 0.5)
        bottomLineSeparator.backgroundColor = UIColor.lightGray.cgColor
        layer.addSublayer(bottomLineSeparator)
        
    }
    

}
