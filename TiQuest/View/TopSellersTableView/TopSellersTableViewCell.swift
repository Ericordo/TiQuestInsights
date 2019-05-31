//
//  TopSellersTableViewCell.swift
//  TiQuest
//
//  Created by Anton C on 30/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class TopSellersTableViewCell: UITableViewCell {
    
    var itemTopSellers : Item? {
        didSet {
            itemNameLabelTopSellers.text = itemTopSellers?.name
        }
    }
    
    let itemNameLabelTopSellers : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 25)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let itemQuantityTopSellers : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 22)
        lbl.textAlignment = .left
        lbl.text = "64"
        return lbl
    }()
    
    private let itemImageTopSellers : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "screenshot")
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let progressBarTopSellers : UIProgressView = {
        let prgsBar = UIProgressView()
        prgsBar.tintColor = .darkGray
        prgsBar.setProgress(0.4, animated: true)
        return prgsBar
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        itemImageTopSellers.layer.cornerRadius = 15
        itemImageTopSellers.clipsToBounds = true
        progressBarTopSellers.layer.cornerRadius = 6
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
        itemImageTopSellers.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        itemImageTopSellers.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1, constant: -20).isActive = true
        itemImageTopSellers.widthAnchor.constraint(equalTo: itemImageTopSellers.heightAnchor, multiplier: 1, constant: 0).isActive = true
        
        itemNameLabelTopSellers.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        itemNameLabelTopSellers.leadingAnchor.constraint(equalTo: itemImageTopSellers.trailingAnchor, constant: 10).isActive = true
        
        itemQuantityTopSellers.leadingAnchor.constraint(equalTo: itemImageTopSellers.trailingAnchor, constant: 10).isActive = true
        itemQuantityTopSellers.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 20).isActive = true
        
        progressBarTopSellers.leadingAnchor.constraint(equalTo: itemQuantityTopSellers.trailingAnchor, constant: 10).isActive = true
        progressBarTopSellers.centerYAnchor.constraint(equalTo: itemQuantityTopSellers.centerYAnchor, constant: 0).isActive = true
        progressBarTopSellers.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        progressBarTopSellers.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
