//
//  CalendarCollectionView.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit

class CalendarCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout.init() )
        setUpCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCell")
        self.decelerationRate = .fast
        
        
        //        TODO: Delete line: 
        self.backgroundColor = .purple
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
