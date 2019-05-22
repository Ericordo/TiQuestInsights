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
    var topCategories = TopCategoriesTableView()
    



    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Configuration of the Today Sales Chart
        todaySalesView = TodaySales(frame: CGRect(x: 0, y: calendarView.calendarHeight+20, width: view.frame.width, height: 250))
        view.addSubview(todaySalesView)
        todaySalesView.contentMode = .scaleAspectFit
        TodaySales.playAnimations()
        topCategories = TopCategoriesTableView(frame: CGRect(x: 10, y: 500, width: 200, height: 200), style: .plain
        )
        view.addSubview(topCategories)
        
  

        // TODO: Delete line below
        self.view.backgroundColor = .lightGray
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        calendarView.showCalendar()
    }
    
   

    




}


