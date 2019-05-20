//
//  CalendarCollectionViewFlowLayout.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class CalendarCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpLayout() {
        self.scrollDirection = .horizontal
    }
    
    
    
}
