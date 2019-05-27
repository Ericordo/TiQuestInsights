//
//  WeatherCollectionViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 24/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let weatherIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cloudy2")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    
    
    func setUpCell() {
//        self.layer.borderWidth = 0.5
//        self.layer.borderColor = UIColor.white.cgColor
        self.addSubview(weatherIcon)
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
//        weatherIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
//        weatherIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        weatherIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        weatherIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        weatherIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        weatherIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
    }
}
