//
//  DashboardViewController.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 17/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit
import Charts


var tableViewHeight : CGFloat?

class DashboardViewController: UIViewController {
    
    static var businessId: Int = 0
    static var businessName: String = ""
    
    var calendarView = CalendarView()
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
    var adminButton : UIBarButtonItem?
//    var refreshButton : UIBarButtonItem?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        calendar.firstWeekday = 2
        calendar.timeZone = .autoupdatingCurrent
        
        self.view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        let margins = self.view.layoutMarginsGuide
        
        //        MARK: Configuration of the Navigation Bar
        self.navigationItem.title = DashboardViewController.businessName
        let attributes = [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20)!, NSAttributedString.Key.foregroundColor : UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        selectButton = UIBarButtonItem.init(title: "Select", style: .plain, target: self, action: #selector(didTapSelect))
        let todayButton = UIBarButtonItem.init(title: "Today", style: .plain, target: self, action: #selector(didTapToday))
        exportButton = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: #selector(didTapExport))
        let settingsButton = UIBarButtonItem.init(title: "Settings", style: .plain, target: self, action: #selector(didTapSettings))
//        refreshButton = UIBarButtonItem.init(title: "Refresh", style: .plain, target: self, action: #selector(didTapRefresh))
        adminButton = UIBarButtonItem.init(title: "Admin", style: .plain, target: self, action: #selector(didTapAdmin))
        
        if DashboardViewController.businessId == 1 {
            self.navigationItem.rightBarButtonItems = [settingsButton, exportButton!, adminButton!]
        } else {
            self.navigationItem.rightBarButtonItems = [settingsButton, exportButton!]
        }
        
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
        
        
        
        
        
        
        detailedHourView.topSellersUpdateDelegate = topSellersView
        
//        if let jsonData = jsonString.data(using: .utf8)
//        {
//            let decoder = JSONDecoder()
//            
//            do {
//                let menuItems = try decoder.decode(MenuItems.self, from: jsonData)
//                topCategoriesView.add(items: menuItems.data.map {$0.category})
//                topSellersView.add(items: menuItems.data.map {$0.name})
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
        
        didTapToday()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewHeight = self.view.frame.height - (71 + calendarView.calendarHeight + 20 + self.view.frame.height / 2.5 + 10 + detailedHourView.detailedViewHeight)
        print(tableViewHeight)
    }
    
  
    
//    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppear")
//        let defaultsOpeningHours = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
//
//
//        let defaultsSales : [Double] = [123, 243, 345, 456, 356, 464, 465, 466, 757, 657, 757, 454, 354, 433, 433, 656, 643, 643, 634, 363, 639, 363, 363, 643]
//        todaySalesChart.setNeedsLayout()
////        todaySalesChart.setBarData(xValues: defaultsOpeningHours, yValues: defaultsSales)
//        todaySalesChart.chartData.notifyDataChanged()
//        todaySalesChart.notifyDataSetChanged()
//        todaySalesChart.animate(yAxisDuration: 1 ,easingOption: .easeInOutQuart)
//        todaySalesChart.highlightValue(nil)
//    }
    
//    @objc func didTapRefresh() {
//        let defaultsOpeningHours = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
//
//
//        let defaultsSales : [Double] = [123, 243, 345, 456, 356, 464, 465, 466, 757, 657, 757, 454, 354, 433, 433, 656, 643, 643, 634, 363, 639, 363, 363, 643]
////                todaySalesChart.setNeedsLayout()
//
//        todaySalesChart.setBarData(xValues: defaultsOpeningHours, yValues: defaultsSales)
//        todaySalesChart.chartData.notifyDataChanged()
//        todaySalesChart.notifyDataSetChanged()
//        todaySalesChart.animate(yAxisDuration: 1 ,easingOption: .easeInOutQuart)
//        todaySalesChart.highlightValue(nil)
//        self.view.layoutIfNeeded()
//    }

    @objc func didTapAdmin() {
        
    }
    
    @objc func didTapToday() {
      
        let currentTimestamp = Int(date.timeIntervalSince1970)
        print(currentTimestamp)
        var todayData : [BusinessDataModel] = []
        DashboardViewController.getBusinessData(businessId: DashboardViewController.businessId, timestamp: currentTimestamp, completion: { dataArray in
            todayData = dataArray
        var timestampArray : [Double] = []
        for data in todayData {
            timestampArray.append(data.datetime)
        }
        print("timestampArray \(timestampArray)")
        var hourArray : [Int] = []
        for timestamp in timestampArray {
          
            let date = Date(timeIntervalSince1970: timestamp/1000)
            let hour = calendar.component(.hour, from: calendar.date(byAdding: .hour, value: -2, to: date)!)
            hourArray.append(hour)
        }
        print("hourArray \(hourArray)")
        
        let defaultsOpeningHours = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
        var revenuePerHour : [Double] = []
        var index = 0
        for defaultHour in defaultsOpeningHours {
            if hourArray.contains(defaultHour) {
                revenuePerHour.append(todayData[index].totalEarnings)
                index += 1
            } else {
                revenuePerHour.append(0)
            }
            }

        
//        If we want to make a sales array
        var salesOfToday : [Sales] = []
        for hour in defaultsOpeningHours {
            let sale = Sales(hour: String(hour), sales: revenuePerHour[hour])
            salesOfToday.append(sale)
        }
        
        
//        Reloading of the chart with new data
        self.todaySalesChart.updateChartBar(xValues: defaultsOpeningHours, yValues:revenuePerHour)
        self.detailedHourView.updateDetailedView(key: 24, data: todayData)

       })
        
        
        calendarView.daysOfCurrentWeek.removeAll()
        calendarView.daysOfSelectedWeek.removeAll()
        calendarView.getCurrentWeek()
        calendarView.calendarCollectionView.reloadData()
//        print("calendarview days of current wk \(calendarView.daysOfCurrentWeek[weekday-1])")
        let todayCellIndexPath = IndexPath.init(row: weekday-1, section: 0)
        print("WEEKDAY \(weekday-1)")
        
        calendarView.calendarCollectionView.selectItem(at: todayCellIndexPath, animated: true, scrollPosition: .right)
        
//        Added this line because when today was Sunday the cell was not selected
        if weekday == 0 {
            calendarView.calendarCollectionView.selectItem(at: [0, 6], animated: true, scrollPosition: .right)
        }
//        calendarLauncher.calendarCollectionView.selectItem(at: todayCellIndexPath, animated: true, scrollPosition: .right)
        //        Origininally weekNumberToDisplay was weekNumber but when the actual day was a Monday the weeknumberlabel  was showing the previous week instead of the actual current week
        var weekNumberToDisplay = 0
        if weekday == 1 {
            weekNumberToDisplay = weekNumber + 1
        } else {
            weekNumberToDisplay = weekNumber
        }
        
        weekNumberLabel.text = "W\(weekNumberToDisplay)"
        let currentMonth = months[calendar.component(.month, from: date) - 1]
        monthLabel.text = "\(currentMonth)\n\(year)"

    }
    
    @objc func didTapSelect() {
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
    
    
    static func convertDateToTimestamp(day: Int, month: Int, year: Int) -> Int {
        let components = DateComponents(calendar: calendar, year: year, month: month, day: day)
        let date = calendar.date(from: components)
        let timestamp = Int((date!.timeIntervalSince1970))
        return timestamp
    }
    
    static func convertTimestampToDate(timestamp: Double) -> Date {
        return Date(timeIntervalSince1970: timestamp/1000)
    }
    
    static func getBusinessData(businessId : Int, timestamp: Int, completion: @escaping (_ dataArray: [BusinessDataModel]) -> Void) {
        var dataArray : [BusinessDataModel] = []
        let id = String(businessId)
        let time = String(timestamp)
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let endpoint = "https://v1.api.tiquest.eu/shop/statistic?shopId=\(id)&period=day&timestamp=\(time)"
        let safeURLString =
            endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let endpointURL = URL(string: safeURLString!) else {
            print("The URL is invalid")
            return
        }
        
        var request = URLRequest(url: endpointURL)
        request.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let jsonData = data else {
                print("The payload is invalid")
                return
            }
        let decoder = JSONDecoder()
            do {
                // With line below JSON parsing was failing (Error: Expected to decode Dictionary<String, Any> but found an array instead)
//                let businessInfo = try decoder.decode(BusinessDayData.self, from: jsonData)
                let businessInfo = try decoder.decode([BusinessHourData].self, from: jsonData)
                print("Business JSON decoded")
                
// With line below JSON parsing was failing (Error: Expected to decode Dictionary<String, Any> but found an array instead)
//                for businessHourData in businessInfo.dayData {
                    for businessHourData in businessInfo {
                    let businessDataModel = BusinessDataModel()
                    
                    businessDataModel.datetime = businessHourData.datetime ?? 0
                    businessDataModel.totalEarnings = businessHourData.totalEarnings ?? 0
                    businessDataModel.totalOrders = businessHourData.totalOrders ?? 0
                    businessDataModel.averageOrderValue = businessHourData.averageOrderValue ?? 0
                    businessDataModel.soldProducts = businessHourData.soldProducts ?? []


//                    businessDataModel.weather = businessHourData.weather
                    
                    dataArray.append(businessDataModel)
                        dataArray.forEach { data in
                            print(data.datetime)
                            print(data.totalEarnings)
                        }
//                    print(dataArray)
//                    print(dataArray[0].averageOrderValue)
//                    print(dataArray[0].totalEarnings)
//                    print(dataArray[0].soldProducts[0].counter)
//                    print(dataArray[0].soldProducts.count)
//                    print(dataArray[0].soldProducts)
                    
                }
                DispatchQueue.main.async {
                    completion(dataArray)
                }
                
            } catch let error {
                print("JSON decoding failed")
                print(error)
            }
        }
        dataTask.resume()
        
    }
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
}


