//
//  TopSellersTableViewCell.swift
//  TiQuest
//
//  Created by Anton C on 30/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class TopSellersTableViewCell: UITableViewCell {
    
//    var itemTopSellers: MenuItems? {
//        didSet {
//            itemNameLabelTopSellers.text = itemTopSellers?.data[0].name
//        }
//    }
    
    let itemNameLabelTopSellers : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 22)
        lbl.textAlignment = .left
        return lbl
    }()
    
    let itemQuantityTopSellers : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.textAlignment = .left
        return lbl
    }()
    
    let itemImageTopSellers : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "screenshot")
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let progressBarTopSellers : UIProgressView = {
        let prgsBar = UIProgressView()
        prgsBar.tintColor = .gray
//        prgsBar.trackTintColor = .clear
        prgsBar.progressViewStyle = .default
        return prgsBar
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        itemImageTopSellers.layer.cornerRadius = (self.frame.height / 3) / 2
        itemImageTopSellers.clipsToBounds = true
        progressBarTopSellers.layer.cornerRadius = (self.frame.width / 50) / 2
        progressBarTopSellers.clipsToBounds = true
        
        addSubview(itemNameLabelTopSellers)
        addSubview(itemQuantityTopSellers)
        addSubview(itemImageTopSellers)
        addSubview(progressBarTopSellers)
        
        itemImageTopSellers.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabelTopSellers.translatesAutoresizingMaskIntoConstraints = false
        itemQuantityTopSellers.translatesAutoresizingMaskIntoConstraints = false
        progressBarTopSellers.translatesAutoresizingMaskIntoConstraints = false
        
        itemImageTopSellers.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        itemImageTopSellers.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width / 30).isActive = true
        itemImageTopSellers.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1, constant: -(self.frame.height / 5)).isActive = true
        itemImageTopSellers.widthAnchor.constraint(equalTo: itemImageTopSellers.heightAnchor, multiplier: 1, constant: 0).isActive = true
        
        itemNameLabelTopSellers.adjustsFontSizeToFitWidth = true
        itemNameLabelTopSellers.leadingAnchor.constraint(equalTo: itemImageTopSellers.trailingAnchor, constant: self.frame.width / 30).isActive = true
        itemNameLabelTopSellers.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -11.5).isActive = true
        
        itemQuantityTopSellers.adjustsFontSizeToFitWidth = true
        itemQuantityTopSellers.leadingAnchor.constraint(equalTo: itemNameLabelTopSellers.trailingAnchor, constant: self.frame.width / 30).isActive = true
//        itemQuantityTopSellers.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.frame.width / 30).isActive = true
        itemQuantityTopSellers.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -11).isActive = true
        
        progressBarTopSellers.leadingAnchor.constraint(equalTo: itemImageTopSellers.trailingAnchor, constant: self.frame.width / 30).isActive = true
        progressBarTopSellers.centerYAnchor.constraint(equalTo: itemImageTopSellers.centerYAnchor, constant: 11).isActive = true
        progressBarTopSellers.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(self.frame.width / 30)).isActive = true
        progressBarTopSellers.heightAnchor.constraint(equalToConstant: self.frame.width / 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
