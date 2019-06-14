//
//  TopCategoriesTableViewBis.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 23/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

class TopCategoriesTableView: NSObject {
    
   var itemsTopCategories : [String] = []
    
    let topCategoriesTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.cornerRadius = 10
        
        tableView.layer.shadowColor = UIColor.gray.cgColor
        tableView.layer.shadowOpacity = 0.3
        tableView.layer.shadowOffset = .zero
        tableView.layer.shadowRadius = 10
        tableView.layer.shouldRasterize = true
        tableView.layer.rasterizationScale = UIScreen.main.scale
        
        return tableView
    }()
    
    func showTopCategories() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(topCategoriesTableView)
            
            topCategoriesTableView.translatesAutoresizingMaskIntoConstraints = false
            topCategoriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 30).isActive = true
            topCategoriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width / 2 - 15).isActive = true
            topCategoriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.width / 30).isActive = true
            topCategoriesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width / 2.5).isActive = true
        }
    }
    
    override init() {
        super.init()
        topCategoriesTableView.delegate = self
        topCategoriesTableView.dataSource = self
        topCategoriesTableView.register(TopCategoriesTableViewCell.self, forCellReuseIdentifier: "TopCategoriesCell")
    }
    
    func add(items: [String]) {
        itemsTopCategories.append(contentsOf: items)
    }
}

extension TopCategoriesTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsTopCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topCategoriesTableView.dequeueReusableCell(withIdentifier: "TopCategoriesCell", for: indexPath) as! TopCategoriesTableViewCell
        let currentItem = itemsTopCategories[indexPath.row]
        cell.itemNameLabelTopCategories.text = currentItem
        cell.backgroundColor = .clear
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return topCategoriesTableView.frame.width / 9.8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return topCategoriesTableView.frame.width / 12
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: topCategoriesTableView.frame.width, height: topCategoriesTableView.frame.width / 9))
        
        headerView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        let headerLabel = UILabel(frame: CGRect(x: headerView.frame.width / 40, y: 0, width:
            headerView.frame.width / 2, height: headerView.frame.height))
        headerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.textColor = UIColor.black
        headerLabel.text = "Top categories"
        headerLabel.textAlignment = .left
        
        let seeAllButton: UIButton = UIButton(frame: CGRect(x:  (headerView.frame.width - headerView.frame.width / 2) - headerView.frame.width / 40, y: 0, width: headerView.frame.width * 0.45, height: headerView.frame.height))
        seeAllButton.setTitle("Bottom", for: .normal)
        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        seeAllButton.titleLabel?.adjustsFontSizeToFitWidth = true
        seeAllButton.contentHorizontalAlignment = .right
        seeAllButton.setTitleColor(.darkGray, for: .normal)
        
        let headerSeparator = UILabel(frame: CGRect(x: 0, y: topCategoriesTableView.frame.width / 12 - 0.5, width: headerView.frame.width, height: 0.5))
        headerSeparator.backgroundColor = .lightGray
        
        headerView.addSubview(headerLabel)
        headerView.addSubview(seeAllButton)
        headerView.addSubview(headerSeparator)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
    
        seeAllButton.leadingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: 80).isActive = true
        seeAllButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
        seeAllButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        seeAllButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        
        return headerView
    }
}

extension UITableView {
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
}
