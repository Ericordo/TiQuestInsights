//
//  CalendarCollectionViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()

        
    }
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? UIColor.red : UIColor.white
        }
    }
    
    
 let dateLabel : UILabel = {
        let label = UILabel()
//        label.frame.size = CGSize(width: 100, height: 50)
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.backgroundColor = .cyan
        return label
        }()
    
    
    func setUpCell() {
        
//        self.frame.size = CGSize(width: 100, height: 50)
        self.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        print("hello")
        
    }
    

}
