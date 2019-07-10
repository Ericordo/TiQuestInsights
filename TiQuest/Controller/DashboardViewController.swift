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
    
    
    
    var calendarView = CalendarView()
    
    var todaySalesView : TodaySales!
    var todaySalesLabel = TodaySalesLabel()
    let weatherView = WeatherCollectionView()
    let detailedHourView = DetailedHourView()
    var todaySalesChart = TodaySalesChart()
    let topCategoriesView = TopCategoriesTableView()
    let topSellersView = TopSellersTableView()
    let calendarLauncher = CalendarLauncher()
    var weekNumberLabel = WeekNumberLabel()
    var monthLabel = MonthLabel()
    
    
    
    var exportButton : UIBarButtonItem?
    var selectButton : UIBarButtonItem?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.firstWeekday = 2
        calendar.timeZone = .autoupdatingCurrent
        
       
        
        self.view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        let margins = self.view.layoutMarginsGuide
        
        
        //        MARK: Configuration of the Navigation Bar
        self.navigationItem.title = "Name of your Store"
        selectButton = UIBarButtonItem.init(title: "Select", style: .plain, target: self, action: #selector(didTapSelect))
        let todayButton = UIBarButtonItem.init(title: "Today", style: .plain, target: self, action: #selector(didTapToday))
        exportButton = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: #selector(didTapExport))
        let settingsButton = UIBarButtonItem.init(title: "Settings", style: .plain, target: self, action: #selector(didTapSettings))
        self.navigationItem.rightBarButtonItems = [settingsButton, exportButton!]
        self.navigationItem.leftBarButtonItems = [selectButton!, todayButton]
        
        //         MARK: Configuration of the Calendar
        calendarView.calendarCollectionView.frame = CGRect(x: 100, y: 71, width: 1024, height: calendarView.calendarHeight)
        self.view.addSubview(calendarView.calendarCollectionView)
        //        calendarView.showCalendar()
        calendarView.calendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.calendarCollectionView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        calendarView.calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarView.calendarHeight).isActive = true
        calendarView.calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        calendarView.calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true

        
        
        
        //         MARK: Configuration of the Today Sales Chart using Macaw Framework
        todaySalesView = TodaySales(frame: CGRect(x: 20, y: calendarView.calendarHeight+71, width: view.frame.width - 20, height: 250))
//        view.addSubview(todaySalesView)
//        todaySalesView.translatesAutoresizingMaskIntoConstraints = false
//        todaySalesView.topAnchor.constraint(equalTo: calendarView.calendarCollectionView.bottomAnchor, constant: 20).isActive = true
//        todaySalesView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        todaySalesView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        todaySalesView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//        todaySalesView.contentMode = .scaleAspectFit
//        TodaySales.playAnimations()
        
        // MARK: Configuration of the WeekNumberLabel
//        let weekNumberLabel = WeekNumberLabel(frame: CGRect(x: 0, y: 71, width: 50, height: 50))
        weekNumberLabel.frame = CGRect(x: 0, y: 71, width: 50, height: 50)
        view.addSubview(weekNumberLabel)
        let bottomLineSeparator : CALayer = {
            let bottomLineSeparator = CALayer()
            bottomLineSeparator.backgroundColor = UIColor.lightGray.cgColor
            return bottomLineSeparator
        }()
            bottomLineSeparator.frame = CGRect(x: 0, y: weekNumberLabel.frame.height-0.5, width: weekNumberLabel.frame.width, height: 0.5)
            weekNumberLabel.layer.addSublayer(bottomLineSeparator)
        weekNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        weekNumberLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        weekNumberLabel.heightAnchor.constraint(equalToConstant: calendarView.calendarHeight).isActive = true
        weekNumberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        weekNumberLabel.trailingAnchor.constraint(equalTo: calendarView.calendarCollectionView.leadingAnchor).isActive = true
        calendarLauncher.weekNumberUpdateDelegate = weekNumberLabel
        
        // MARK: Configuration of the Total Sales Label
//        todaySalesLabel.showTodaySalesLabel()
        
        // MARK: Configuration of the MonthLabel
//        let monthLabel = MonthLabel(frame: CGRect(x: 0, y: 71, width: 150, height: 50))
        monthLabel.frame = CGRect(x: 0, y: 71, width: 150, height: 50)
        view.addSubview(monthLabel)
        let bottomLineSeparatorMonthLabel : CALayer = {
            let bottomLineSeparator = CALayer()
            bottomLineSeparator.backgroundColor = UIColor.lightGray.cgColor
            return bottomLineSeparator
        }()
            bottomLineSeparatorMonthLabel.frame = CGRect(x: 0, y: monthLabel.frame.height-0.5, width: monthLabel.frame.width, height: 0.5)
            monthLabel.layer.addSublayer(bottomLineSeparatorMonthLabel)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        monthLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant: calendarView.calendarHeight).isActive = true
        monthLabel.leadingAnchor.constraint(equalTo: calendarView.calendarCollectionView.trailingAnchor, constant: 0).isActive = true
        monthLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        calendarLauncher.monthLabelUpdateDelegate = monthLabel
        
        
                // MARK: Configuration of the Today Sales Chart using Charts Framework
        todaySalesChart = TodaySalesChart(frame: CGRect(x: 20, y: calendarView.calendarHeight+71, width: view.frame.width - 20, height: 250))
        todaySalesChart.contentMode = .scaleAspectFit
        view.addSubview(todaySalesChart)
        todaySalesChart.translatesAutoresizingMaskIntoConstraints = false
        todaySalesChart.topAnchor.constraint(equalTo: calendarView.calendarCollectionView.bottomAnchor, constant: 20).isActive = true
        todaySalesChart.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        todaySalesChart.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        todaySalesChart.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2.5).isActive = true
        

        calendarView.dataUpdateDelegate = todaySalesChart
        todaySalesChart.detailedViewUpdateDelegate = detailedHourView
        
//                 MARK: Configuration of the Detailed View
//        detailedHourView.showDetailedHourView()
        let detailedView = detailedHourView.detailedHourCollectionView
        detailedView.frame = CGRect(x: 0, y: 371 + detailedHourView.detailedViewHeight, width: view.frame.width, height: detailedHourView.detailedViewHeight)
        detailedHourView.cellWidth = (view.frame.width - 80) / 6
//        detailedView.sizeThatFits(CGSize(width: detailedHourView.cellWidth, height: 60))
        self.view.addSubview(detailedView)
        detailedView.translatesAutoresizingMaskIntoConstraints = false
        detailedView.topAnchor.constraint(equalTo: todaySalesChart.bottomAnchor, constant: 10).isActive = true
        detailedView.heightAnchor.constraint(equalToConstant: detailedHourView.detailedViewHeight).isActive = true
        detailedView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        detailedView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -40).isActive = true

    
//        infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
//        infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
        
        
        //         MARK: Configuration of the TableViews
        
        
        let topCategoriesTableView = topCategoriesView.topCategoriesTableView
        let topSellersTableView = topSellersView.topSellersTableView

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.addArrangedSubview(topCategoriesTableView)
        stackView.addArrangedSubview(topSellersTableView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: detailedView.bottomAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        
        if let jsonData = jsonString.data(using: .utf8)
        {
            let decoder = JSONDecoder()
            
            do {
                let menuItems = try decoder.decode(MenuItems.self, from: jsonData)
                topCategoriesView.add(items: menuItems.data.map {$0.category})
                topSellersView.add(items: menuItems.data.map {$0.name})
            } catch {
                print(error.localizedDescription)
            }
        }
        
        didTapToday()
    }
    

    
 
    
    

    @objc func didTapToday() {
      
//        calendarView.calendarCollectionView.selectItem(at: lastCellIndexPath, animated: true, scrollPosition: .right)
        calendarView.daysOfCurrentWeek.removeAll()
        calendarView.daysOfSelectedWeek.removeAll()
        calendarView.getCurrentWeek()
        calendarView.calendarCollectionView.reloadData()
        print("calendarview days of current wk \(calendarView.daysOfCurrentWeek[weekday-1])")
        let todayCellIndexPath = IndexPath.init(row: weekday-1, section: 0)
        calendarView.calendarCollectionView.selectItem(at: todayCellIndexPath, animated: true, scrollPosition: .right)
        calendarLauncher.calendarCollectionView.selectItem(at: todayCellIndexPath, animated: true, scrollPosition: .right)
        weekNumberLabel.text = "W\(weekNumber)"
        let currentMonth = months[calendar.component(.month, from: date) - 1]
        monthLabel.text = "\(currentMonth)\n\(year)"

//        TodaySales.playAnimations()
        todaySalesChart.updateChartBar()
    }
    
    @objc func didTapSelect() {
        //
        //        //        TODO: Make a PopOverPresentationController showing the calendar
//                let ac = UIAlertController(title: "Hello!", message: "This is a test.", preferredStyle: .actionSheet)
//                let popover = ac.popoverPresentationController
////                popover?.sourceView = self.view
//
//            popover?.sourceRect = CGRect(x: 10, y: 10, width: 200, height: 200)
//                popover?.barButtonItem = selectButton
//                present(ac, animated: true)

    calendarLauncher.showCalendar()
    calendarLauncher.calendarUpdateDelegate = calendarView
        
    }
    
    @objc func didTapExport() {
        let activityViewController = UIActivityViewController(activityItems: [takeScreenshot() as Any], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        if let popOver = activityViewController.popoverPresentationController {
            popOver.sourceView = self.view
            popOver.barButtonItem = exportButton
        }
    }
    
    @objc func didTapSettings() {
        let settingsVC = SettingsViewController()
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    open func takeScreenshot(_ shouldSave: Bool = true) -> UIImage? {
        var screenshotImage :UIImage?
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenshotImage
    }
    
    
    
    
    

    
    
    
    
    
    
    
    
}


