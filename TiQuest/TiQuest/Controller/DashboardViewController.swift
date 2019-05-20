//
//  DashboardViewController.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 17/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit
import Macaw


class DashboardViewController: UIViewController {
    
    var calendarCollectionView: CalendarCollectionView!
    let dates = Dates()

    override func viewDidLoad() {
        super.viewDidLoad()
        let calendarLayout = CalendarCollectionViewFlowLayout()
        calendarCollectionView = CalendarCollectionView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 50), collectionViewLayout: calendarLayout)
        print(view.frame.width)
        view.addSubview(calendarCollectionView)
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        
        
        
        
        

        // TODO: Delete line below
        self.view.backgroundColor = .lightGray
    }



}

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
        cell.dateLabel.text = dates.dates[indexPath.item]
        
        
        return cell
    }
    
    
}

extension DashboardViewController: UICollectionViewDelegate {
    
}
