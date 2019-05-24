//
//  TopCategoriesTableViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 22/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class TopCategoriesTableViewCell: UITableViewCell {
    
    let categoryImage = UIImageView()
    let categoryName = UILabel()
    let categoryQuantity = UILabel()
    let categoryProgressBar = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryName.translatesAutoresizingMaskIntoConstraints = false
        categoryQuantity.translatesAutoresizingMaskIntoConstraints = false
        categoryProgressBar.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryName)
        contentView.addSubview(categoryQuantity)
        contentView.addSubview(categoryProgressBar)
        
        let viewsDict = [
            "categoryImage" : categoryImage,
            "categoryName" : categoryName,
            "categoryQuantity" : categoryQuantity,
            "categoryProgressBar" : categoryProgressBar,
        ]
        
//        CONSTRAINTS
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
