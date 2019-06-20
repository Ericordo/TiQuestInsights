//
//  TopCategoriesTableViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 22/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class TopCategoriesTableViewCell: UITableViewCell {
    
    var itemsCategory: MenuItems?
    
//    var itemTopCategories : String? {
//        didSet {
//            itemNameLabelTopCategories.text = itemsCategory?.data[0].category
//        }
//    }
    
     let itemNameLabelTopCategories : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 22)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .left
        return lbl
    }()
    
    let itemQuantityTopCategories : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .left
        return lbl
    }()

    let itemImageTopCategories : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "screenshot")
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let progressBarTopCategories : UIProgressView = {
        let prgsBar = UIProgressView()
        prgsBar.tintColor = .lightGray
        prgsBar.trackTintColor = .clear
        prgsBar.progressViewStyle = .default
        return prgsBar
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        itemImageTopCategories.layer.cornerRadius = (self.frame.height / 3) / 2
        itemImageTopCategories.clipsToBounds = true
        progressBarTopCategories.layer.cornerRadius = (self.frame.width / 50) / 2
        progressBarTopCategories.clipsToBounds = true
        
        addSubview(itemNameLabelTopCategories)
        addSubview(itemQuantityTopCategories)
        addSubview(itemImageTopCategories)
        addSubview(progressBarTopCategories)
        
        itemImageTopCategories.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabelTopCategories.translatesAutoresizingMaskIntoConstraints = false
        itemQuantityTopCategories.translatesAutoresizingMaskIntoConstraints = false
        progressBarTopCategories.translatesAutoresizingMaskIntoConstraints = false
        
        itemImageTopCategories.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        itemImageTopCategories.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width / 30).isActive = true
        itemImageTopCategories.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1, constant: -(self.frame.height / 5)).isActive = true
        itemImageTopCategories.widthAnchor.constraint(equalTo: itemImageTopCategories.heightAnchor, multiplier: 1, constant: 0).isActive = true
        
        itemNameLabelTopCategories.adjustsFontSizeToFitWidth = true
        itemNameLabelTopCategories.leadingAnchor.constraint(equalTo: itemImageTopCategories.trailingAnchor, constant: self.frame.width / 30).isActive = true
        itemNameLabelTopCategories.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -11.5).isActive = true
        
        itemQuantityTopCategories.adjustsFontSizeToFitWidth = true
        itemQuantityTopCategories.leadingAnchor.constraint(equalTo: itemNameLabelTopCategories.trailingAnchor, constant: self.frame.width / 30).isActive = true
        itemQuantityTopCategories.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.frame.width / 30) 
        itemQuantityTopCategories.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -11).isActive = true
        
        progressBarTopCategories.leadingAnchor.constraint(equalTo: itemImageTopCategories.trailingAnchor, constant: self.frame.width / 30).isActive = true
        progressBarTopCategories.centerYAnchor.constraint(equalTo: itemImageTopCategories.centerYAnchor, constant: 11).isActive = true
        progressBarTopCategories.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(self.frame.width / 30)).isActive = true
        progressBarTopCategories.heightAnchor.constraint(equalToConstant: self.frame.width / 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
