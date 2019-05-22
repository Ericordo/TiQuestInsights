//
//  TopCategoriesTableView.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 22/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class TopCategoriesTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        setUpTableView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpTableView() {
        self.delegate = self
        self.dataSource = self
        self.register(TopCategoriesTableViewCell.self, forCellReuseIdentifier: "TopCategoryCell")
        
    }
    


}

extension TopCategoriesTableView: UITableViewDelegate, UITableViewDataSource {
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.dequeueReusableCell(withIdentifier: "TopCategoryCell", for: indexPath)
    cell.backgroundColor = .black
    return cell
    
}

}

