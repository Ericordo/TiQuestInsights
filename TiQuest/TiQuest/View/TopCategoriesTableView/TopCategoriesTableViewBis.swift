//
//  TopCategoriesTableViewBis.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 23/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

class TopCategoriesTableViewBis: NSObject {
    
   
    
    let topCategoriesTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
    
    func showtopCategories() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(topCategoriesTableView)
            topCategoriesTableView.frame = CGRect(x: 10, y: 500, width: 300, height: 300)
            
            
        }
    }
    
    
    override init() {
        super.init()
        topCategoriesTableView.delegate = self
        topCategoriesTableView.dataSource = self
        topCategoriesTableView.register(TopCategoriesTableViewCell.self, forCellReuseIdentifier: "TopCategoryCell")
    }
    
}

extension TopCategoriesTableViewBis: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topCategoriesTableView.dequeueReusableCell(withIdentifier: "TopCategoryCell", for: indexPath)
        cell.backgroundColor = .cyan
        
      
        return cell
        
    }
    
    
}