//
//  TopSellersTableView.swift
//  TiQuest
//
//  Created by Anton C on 30/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit
import Foundation

class TopSellersTableView: NSObject {
    
    var itemsTopSellers : [String] = []
    
    let topSellersTableView : UITableView = {
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
    
    func showTopSellers() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(topSellersTableView)
            
            topSellersTableView.translatesAutoresizingMaskIntoConstraints = false
            topSellersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 30).isActive = true
            topSellersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width / 2 - 15).isActive = true
            topSellersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.width / 30).isActive = true
            topSellersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width / 2.5).isActive = true
        }
    }
    
    override init() {
        super.init()
        topSellersTableView.delegate = self
        topSellersTableView.dataSource = self
        topSellersTableView.register(TopSellersTableViewCell.self, forCellReuseIdentifier: "TopSellersCell")
    }
    
    func add(items: [String]) {
        itemsTopSellers.append(contentsOf: items)
    }
    
}

extension TopSellersTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsTopSellers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topSellersTableView.dequeueReusableCell(withIdentifier: "TopSellersCell", for: indexPath) as! TopSellersTableViewCell
        let currentItem = itemsTopSellers[indexPath.row]
        cell.itemNameLabelTopSellers.text = currentItem
        cell.backgroundColor = .white
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return topSellersTableView.frame.width / 9.8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return topSellersTableView.frame.width / 12
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: topSellersTableView.frame.width, height: topSellersTableView.frame.width / 9))
        
        headerView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        let headerLabel = UILabel(frame: CGRect(x: headerView.frame.width / 40, y: 0, width:
            headerView.frame.width / 2, height: headerView.frame.height))
        headerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.textColor = UIColor.black
        headerLabel.text = "Top sellers"
        headerLabel.textAlignment = .left
        
        let seeAllButton: UIButton = UIButton(frame: CGRect(x:  (headerView.frame.width - headerView.frame.width / 2) - headerView.frame.width / 40, y: 0, width: headerView.frame.width * 0.45, height: headerView.frame.height))
        seeAllButton.setTitle("Worst", for: .normal)
        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        seeAllButton.titleLabel?.adjustsFontSizeToFitWidth = true
        seeAllButton.contentHorizontalAlignment = .right
        seeAllButton.setTitleColor(.darkGray, for: .normal)
        
        let headerSeparator = UILabel(frame: CGRect(x: 0, y: topSellersTableView.frame.width / 12 - 0.5, width: headerView.frame.width, height: 0.5))
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
