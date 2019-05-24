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
    let topCategoriesView = TopCategoriesTableView()
    var todaySalesView : TodaySales!
  
    



    override func viewDidLoad() {
        super.viewDidLoad()
        //        MARK: Configuration of the Navigation Bar
        self.navigationItem.title = "Name of your Store"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Select", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Today", style: .plain, target: self, action: nil)
    
        
        
        // MARK: Configuration of the Today Sales Chart
        todaySalesView = TodaySales(frame: CGRect(x: 0, y: calendarView.calendarHeight+70, width: view.frame.width, height: 250))
        view.addSubview(todaySalesView)
        todaySalesView.contentMode = .scaleAspectFit
        TodaySales.playAnimations()
        
        
        print(view.frame.height)
        

        
  

        // TODO: Delete line below
        self.view.backgroundColor = .lightGray
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        calendarView.showCalendar()
        topCategoriesView.showtopCategories()
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let topSpace:CGFloat?
        if #available(iOS 11.0, *) {
            topSpace = self.view.safeAreaInsets.top
        } else {
            topSpace = self.topLayoutGuide.length
        }
        print(topSpace)
    }
    
   

    




}


