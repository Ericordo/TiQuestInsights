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
    
    var exportButton : UIBarButtonItem?
   
    



    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        MARK: Configuration of the Navigation Bar
        self.navigationItem.title = "Name of your Store"
        let selectButton = UIBarButtonItem.init(title: "Select", style: .plain, target: self, action: #selector(didTapSelect))
        let todayButton = UIBarButtonItem.init(title: "Today", style: .plain, target: self, action: #selector(didTapToday))
        exportButton = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: #selector(didTapExport))
        let logOutButton = UIBarButtonItem.init(title: "Log Out", style: .plain, target: self, action: #selector(didTapLogOut))
        self.navigationItem.rightBarButtonItems = [logOutButton, exportButton!]
        self.navigationItem.leftBarButtonItems = [selectButton, todayButton]
        
        
        //         MARK: Configuration of the Today Sales Chart
        todaySalesView = TodaySales(frame: CGRect(x: 20, y: calendarView.calendarHeight+71, width: view.frame.width - 20, height: 250))
        view.addSubview(todaySalesView)
        todaySalesView.contentMode = .scaleAspectFit
        TodaySales.playAnimations()
        
        view.addSubview(WeekNumberLabel(frame: CGRect(x: 0, y: 71, width: 100, height: 50)))
        weatherView.showWeather()
        detailedHourView.showDetailedHourView()
        todaySalesLabel.showTodaySalesLabel()
        calendarView.showCalendar()
        
        self.view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        topCategoriesView.showtopCategories()
    }

    @objc func didTapToday() {
        let lastCellIndexPath = IndexPath.init(row: dates.count-1, section: 0)
        calendarView.calendarCollectionView.selectItem(at: lastCellIndexPath, animated: true, scrollPosition: .right)
        TodaySales.playAnimations()
    }
    
    @objc func didTapSelect() {
//        
//        //        TODO: Make a PopOverPresentationController showing the calendar
//        let ac = UIAlertController(title: "Hello!", message: "This is a test.", preferredStyle: .actionSheet)
//        let popover = ac.popoverPresentationController
//        popover?.sourceRect = CGRect(x: 0, y: 0, width: 100, height: 500)
//        present(ac, animated: true)
    }
    
    @objc func didTapExport() {
        
    
        
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img!], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        

        if let popOver = activityViewController.popoverPresentationController {
            popOver.sourceView = self.view
//            popOver.sourceRect =
            popOver.barButtonItem = exportButton
        }
    }
    
    @objc func didTapLogOut() {
        
    }
    
//    open func takeScreenshot(_ shouldSave: Bool = true) -> UIImage? {
//        print("takeScreenshot")
//        var screenshotImage :UIImage?
//        let layer = UIApplication.shared.keyWindow!.layer
//        let scale = UIScreen.main.scale
//        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
//        guard let context = UIGraphicsGetCurrentContext() else {return nil}
//        layer.render(in:context)
//        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
////        if let image = screenshotImage, shouldSave {
////            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
////        }
//        return screenshotImage
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
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


