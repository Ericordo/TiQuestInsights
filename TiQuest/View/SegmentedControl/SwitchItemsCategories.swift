//
//  SegmentedControl.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 26/09/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

class SwitchItemsCategories :  NSObject {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let switchItemsCategories : UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Items", "Categories"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        segmentedControl.tintColor = UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)
        return segmentedControl
    }()
    

    
}
