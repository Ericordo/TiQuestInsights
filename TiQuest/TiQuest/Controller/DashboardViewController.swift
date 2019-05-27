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
    var todaySalesLabel = TodaySalesLabel()
    let weatherView = WeatherCollectionView()
    let detailedHourView = DetailedHourView()
    

    



    override func viewDidLoad() {
        super.viewDidLoad()
        //        MARK: Configuration of the Navigation Bar
        self.navigationItem.title = "Name of your Store"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Select", style: .plain, target: self, action: #selector(didTapSelect))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Today", style: .plain, target: self, action: #selector(didTapToday))
    
        
        
        // MARK: Configuration of the Today Sales Chart
        todaySalesView = TodaySales(frame: CGRect(x: 20, y: calendarView.calendarHeight+70, width: view.frame.width - 20, height: 250))
        view.addSubview(todaySalesView)
        todaySalesView.contentMode = .scaleAspectFit
        TodaySales.playAnimations()
        
        
        print(view.frame.height)
        

        
  

        // TODO: Delete line below
        self.view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        calendarView.showCalendar()
        topCategoriesView.showtopCategories()
        todaySalesLabel.showTodaySalesLabel()
        weatherView.showWeather()
        detailedHourView.showDetailedHourView()
        
    }

    @objc func didTapToday() {
        let lastCellIndexPath = IndexPath.init(row: dates.count-1, section: 0)
        calendarView.calendarCollectionView.selectItem(at: lastCellIndexPath, animated: true, scrollPosition: .right)
    }
    
    @objc func didTapSelect() {
        
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


