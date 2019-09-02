//
//  toItemListTableViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 01/09/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class ToItemListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    let toItemListLabel : UILabel = {
        let label = UILabel()
        label.text = "List of items"
        return label
    }()

    func setConstraints() {
        self.addSubview(toItemListLabel)
        toItemListLabel.translatesAutoresizingMaskIntoConstraints = false
        self.toItemListLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.toItemListLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        self.toItemListLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.toItemListLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
