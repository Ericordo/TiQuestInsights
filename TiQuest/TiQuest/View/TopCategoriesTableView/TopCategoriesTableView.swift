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
    
    let topCategoriesView : UIView = {
        let topView = UIView()
        
        topView.layer.shadowColor = UIColor.gray.cgColor
        topView.layer.shadowOpacity = 1
        topView.layer.shadowOffset = .zero
        topView.layer.shadowRadius = 10
        topView.layer.shouldRasterize = true
        topView.layer.rasterizationScale = UIScreen.main.scale
        
        return topView
    }()
    
    let topCategoriesTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.cornerRadius = 10
        return tableView
    }()
    
    func showTopCategories() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(topCategoriesView)
            topCategoriesView.frame = CGRect(x: 50, y: 500, width: view.frame.width/2-80, height: 470)
            topCategoriesView.addSubview(topCategoriesTableView)
            topCategoriesTableView.frame = CGRect(x: 0, y: 0, width: view.frame.width/2-80, height: 470)
        }
    }
    
    override init() {
        super.init()
        topCategoriesTableView.delegate = self
        topCategoriesTableView.dataSource = self
        topCategoriesTableView.register(TopCategoriesTableViewCell.self, forCellReuseIdentifier: "TopCategoriesCell")
    }
    
    func addItems() {
        itemsTopCategories.append(cheeseburger.category!)
        itemsTopCategories.append(margherita.category!)
        itemsTopCategories.append(redWine.category!)
        itemsTopCategories.append(whiteWine.category!)
        itemsTopCategories.append(beer.category!)
        itemsTopCategories.append(coke.category!)
        itemsTopCategories.append(fanta.category!)
        itemsTopCategories.append(tomateMoza.category!)
        itemsTopCategories.append(pannaCotta.category!)
        itemsTopCategories.append(chocolateIceCream.category!)
//        itemsTopCategories.append(bruschetta.category!)
        itemsTopCategories.append(pastaCabonara.category!)
        itemsTopCategories.append(pastaBolognese.category!)
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
        headerLabel.text = "Top categories"
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
