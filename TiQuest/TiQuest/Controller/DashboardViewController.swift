//
//  DashboardViewController.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 17/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit
import Macaw
import Charts


class DashboardViewController: UIViewController {
    
    let calendarView = Calendar()
    var todaySalesView : TodaySales!
 



    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Configuration of the Today Sales Chart
        todaySalesView = TodaySales(frame: CGRect(x: 0, y: calendarView.calendarHeight+20, width: view.frame.width, height: 350))
        todaySalesView.contentMode = .scaleAspectFit
        view.addSubview(todaySalesView)
        


        // TODO: Delete line below
        self.view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        calendarView.showCalendar()
    }
    






}
//
//extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dates.dates.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
//        cell.dateLabel.text = dates.dates[indexPath.item]
//
//        print("hello")
//        return cell
//    }
//
//
//}
//
//extension DashboardViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = calendarCollectionView.frame.height
//        let width  = CGFloat(50)
//        return CGSize(width: width, height: height)
//    }

