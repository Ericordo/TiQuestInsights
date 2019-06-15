//
//  LogOutTableViewCell.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 14/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit



class LogOutTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.addSubview(logOutLabel)
        logOutLabel.translatesAutoresizingMaskIntoConstraints = false
        self.logOutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.logOutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        self.logOutLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.logOutLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    let logOutLabel : UILabel = {
        let label = UILabel()
        label.text = "Log Out"
        label.textColor = .red
        
        return label
    }()
    
    
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
