//
//  DetailedHourCollectionViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 27/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class DetailedHourCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let infoLabel : UILabel = {
        let label = UILabel()
//        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    func setUpCell() {
//        self.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)

        self.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
//        infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        let bottomLineSeparator = CALayer()
        bottomLineSeparator.frame = CGRect(x: 0, y: self.frame.height-0.5, width: self.frame.width, height: 0.5)
        bottomLineSeparator.backgroundColor = UIColor.lightGray.cgColor
        layer.addSublayer(bottomLineSeparator)
        
    
    }
    
}
