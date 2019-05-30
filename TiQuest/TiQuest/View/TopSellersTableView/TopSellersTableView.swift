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
    var itemsTopSellers : [Item] = [Item]()
    
    let topSellersView : UIView = {
        let topView = UIView()
        
        topView.layer.shadowColor = UIColor.gray.cgColor
        topView.layer.shadowOpacity = 1
        topView.layer.shadowOffset = .zero
        topView.layer.shadowRadius = 10
        topView.layer.shouldRasterize = true
        topView.layer.rasterizationScale = UIScreen.main.scale
        
        return topView
    }()
    
    let topSellersTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.cornerRadius = 10
        return tableView
    }()
    
    func showTopSellers() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(topSellersView)
            topSellersView.frame = CGRect(x: (view.frame.width-(view.frame.width/2-80))-50, y: 500, width: view.frame.width/2-80, height: 470)
            topSellersView.addSubview(topSellersTableView)
            topSellersTableView.frame = CGRect(x: 0, y: 0, width: view.frame.width/2-80, height: 470)
        }
    }
    
    override init() {
        super.init()
        topSellersTableView.delegate = self
        topSellersTableView.dataSource = self
        topSellersTableView.register(TopSellersTableViewCell.self, forCellReuseIdentifier: "TopSellersCell")
    }
    
    func addTopSellersItems() {
        itemsTopSellers.append(cheeseburger)
        itemsTopSellers.append(margherita)
        itemsTopSellers.append(redWine)
        itemsTopSellers.append(whiteWine)
        itemsTopSellers.append(beer)
        itemsTopSellers.append(coke)
        itemsTopSellers.append(fanta)
        itemsTopSellers.append(tomateMoza)
        itemsTopSellers.append(pannaCotta)
        itemsTopSellers.append(chocolateIceCream)
        itemsTopSellers.append(bruschetta)
        itemsTopSellers.append(pastaCabonara)
        itemsTopSellers.append(pastaBolognese)
    }
}

extension TopSellersTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsTopSellers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topSellersTableView.dequeueReusableCell(withIdentifier: "TopSellersCell", for: indexPath) as! TopSellersTableViewCell
        let currentItem = itemsTopSellers[indexPath.row]
        cell.itemNameLabelTopSellers.text = currentItem.name
        cell.backgroundColor = .white
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        headerView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width:
            tableView.bounds.size.width, height: 70))
        headerLabel.font = UIFont.boldSystemFont(ofSize: 40)
        headerLabel.textColor = UIColor.black
        headerLabel.text = "Top sellers"
        headerLabel.textAlignment = .left
        
        let headerSeparator = UILabel(frame: CGRect(x: 0, y: 69, width: tableView.bounds.size.width, height: 0.5))
        headerSeparator.backgroundColor = .lightGray
        
        headerView.addSubview(headerLabel)
        headerView.addSubview(headerSeparator)
        
        // code for adding SEE ALL BUTTON to right corner of the header
        
        //        let seeAllButton: UIButton = UIButton(frame: CGRect(x:  tableView.bounds.size.width - 100, y: 20, width: 100, height: 30))
        //        seeAllButton.setTitle("See All", for: .normal)
        //        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        //        seeAllButton.setTitleColor(.blue, for: .normal)
        //        headerView.addSubview(seeAllButton)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}
