//
//  SlideCalendarCollectionViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 17/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class SlideCalendarCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            
//            self.backgroundColor = isSelected ? UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0) : UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
//            self.dayNumberLabel.textColor = isSelected ? .white : .black
            
            dayNumberLabel.layer.backgroundColor = isSelected ? UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0).cgColor : UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0).cgColor
            self.dayNumberLabel.textColor = isSelected ? .white : .black
            
            self.backgroundColor = isSelected ? UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0) : UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
            
            }
        }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dayNumberLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        
        label.textColor = .black
        
        label.layer.cornerRadius = 40 / 2
        label.layer.borderWidth = 2.0
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.borderColor = UIColor.black.cgColor
        
        
        return label
    }()
    
    func setupViews() {
        addSubview(dayNumberLabel)
        dayNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        dayNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        dayNumberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        dayNumberLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        dayNumberLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
    }
    
}
