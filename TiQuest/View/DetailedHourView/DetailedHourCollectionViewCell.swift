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
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.lightGray
        label.textAlignment = .left
        return label
    }()
    
    let variableLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    func setUpCell() {
//        self.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)

  
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true


//        self.addSubview(infoLabel)
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
//        infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
//        infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
////        infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        self.addSubview(variableLabel)
        variableLabel.translatesAutoresizingMaskIntoConstraints = false
        variableLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        variableLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        variableLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        variableLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        
        
//        let bottomLineSeparator = CALayer()
//        bottomLineSeparator.frame = CGRect(x: 0, y: self.frame.height-0.5, width: self.frame.width, height: 0.5)
//        bottomLineSeparator.backgroundColor = UIColor.lightGray.cgColor
//        layer.addSublayer(bottomLineSeparator)
        
    
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
////
////        if let view = UIApplication.shared.keyWindow {
////            if view.frame.width < 500 {
////                        setNeedsLayout()
////                        layoutIfNeeded()
////
////                        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
////
////                        var frame = layoutAttributes.frame
////                        frame.size.width = ceil(size.width)
////                        layoutAttributes.frame = frame
////
////            }
////
////        }
////        setNeedsLayout()
////        layoutIfNeeded()
////
////        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
////
////        var frame = layoutAttributes.frame
////        frame.size.width = ceil(size.width)
////        layoutAttributes.frame = frame
//
//        return layoutAttributes
//    }
    
}
