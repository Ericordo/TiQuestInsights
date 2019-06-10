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
    
    var itemTopCategories : String? {
        didSet {
            itemNameLabelTopCategories.text = itemsCategory?.data[0].category
        }
    }
    
//    var itemTopCategories : Item? {
//        didSet {
//            itemNameLabelTopCategories.text = itemTopCategories?.name
//        }
//    }
    
     let itemNameLabelTopCategories : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 25)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let itemQuantityTopCategories : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 22)
        lbl.textAlignment = .left
        lbl.text = "64"
        return lbl
    }()
    
    private let itemImageTopCategories : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "screenshot")
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let progressBarTopCategories : UIProgressView = {
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
        
        
        itemImageTopCategories.layer.cornerRadius = 12
        itemImageTopCategories.clipsToBounds = true
        progressBarTopCategories.layer.cornerRadius = 6
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
        itemImageTopCategories.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        itemImageTopCategories.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1, constant: -25).isActive = true
        itemImageTopCategories.widthAnchor.constraint(equalTo: itemImageTopCategories.heightAnchor, multiplier: 1, constant: 0).isActive = true
        
        itemNameLabelTopCategories.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        itemNameLabelTopCategories.leadingAnchor.constraint(equalTo: itemImageTopCategories.trailingAnchor, constant: 10).isActive = true
        
        itemQuantityTopCategories.leadingAnchor.constraint(equalTo: itemImageTopCategories.trailingAnchor, constant: 10).isActive = true
        itemQuantityTopCategories.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 20).isActive = true
        
        progressBarTopCategories.leadingAnchor.constraint(equalTo: itemQuantityTopCategories.trailingAnchor, constant: 10).isActive = true
        progressBarTopCategories.centerYAnchor.constraint(equalTo: itemQuantityTopCategories.centerYAnchor, constant: 0).isActive = true
        progressBarTopCategories.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        progressBarTopCategories.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
