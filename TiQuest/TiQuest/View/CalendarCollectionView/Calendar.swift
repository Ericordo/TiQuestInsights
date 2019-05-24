//
//  Calendar.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 21/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit

class Calendar: NSObject {
    
    
    
    
    let dates = Dates().dates
    let calendarHeight : CGFloat = 50
    let cellWdith : CGFloat = 150
    
    let calendarCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.decelerationRate = .fast
        cv.backgroundColor = .gray
        return cv
    }()
    
    func showCalendar() {
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(calendarCollectionView)
            calendarCollectionView.frame = CGRect(x: 0, y: 70, width: view.frame.width, height: calendarHeight)
            print(view.frame.width)
            
        }
    }
    
    override init() {
        super.init()
        
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        
        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCell")
        
    }
    
    
}

extension Calendar: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
        cell.dateLabel.text = dates[indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      TodaySales.playAnimations()
    }
    
    
}

extension Calendar : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWdith, height: calendarHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
}
