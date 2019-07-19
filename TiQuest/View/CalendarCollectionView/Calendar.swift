//
//  Calendar.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 21/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation
import UIKit
import Charts

protocol DataUpdateDelegate {
    func updateChartBar(xValues: [Int], yValues: [Double])
    func sendSelectedDayData(data: [BusinessDataModel])
}

class CalendarView: NSObject {
    
    var dataUpdateDelegate : DataUpdateDelegate!
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var currentMonth = String()
    
    let dates = Dates().dates
    let datesbis = DatesBis().dates
    let calendarHeight : CGFloat = 50
    var cellWidth : CGFloat = 150
    
    var daysOfSelectedWeek = [Int]()
    var daysOfCurrentWeek = [Int]()
    
    var selectedDay : Int = 0
    var selectedMonth : Int = 0
    var selectedYear : Int = 0
    
    
    
    let calendarCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        cv.decelerationRate = .fast
        cv.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1.0)
        return cv
    }()
    
//    func showCalendar() {
//        if let view = UIApplication.shared.keyWindow {
//            view.addSubview(calendarCollectionView)
//            calendarCollectionView.frame = CGRect(x: 100, y: 71, width: view.frame.width-100, height: calendarHeight)
//            print(view.frame.width)
//        }
//    }
    
    override init() {
        super.init()
        
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCell")
        
        currentMonth = months[month]
       
        getCurrentWeek()
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func circleAroundDigit(_ num:Int, circleColor:UIColor,
                           digitColor:UIColor, diameter:CGFloat,
                           font:UIFont) -> UIImage {
        precondition((0...31).contains(num), "digit is not a digit")
        let p = NSMutableParagraphStyle()
        p.alignment = .center
        let s = NSAttributedString(string: String(num), attributes:
            [.font:font, .foregroundColor:digitColor, .paragraphStyle:p])
        let r = UIGraphicsImageRenderer(size: CGSize(width:diameter, height:diameter))
        return r.image {con in
            circleColor.setFill()
            con.cgContext.fillEllipse(in:
                CGRect(x: 0, y: 0, width: diameter, height: diameter))
            s.draw(in: CGRect(x: 0, y: diameter / 2 - font.lineHeight / 2,
                              width: diameter, height: diameter))
        }
    }
    
    
}

extension CalendarView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
//        cell.dateLabel.text = dates[indexPath.item]
//        cell.dateLabel.text = datesbis[indexPath.item].day + " " + String(datesbis[indexPath.item].number)
//        let stringForCell = NSAttributedString(string: datesbis[indexPath.item].day + " " + String(datesbis[indexPath.item].number))
//        cell.dateLabel.attributedText = stringForCell
//        cell.dateLabel.text = "\(daysOfMonth[weekday-1]) "+"\(day)"
        switch indexPath.row {
        case 0:
            if daysOfSelectedWeek.isEmpty {
                cell.dateLabel.text = "Monday "+"\(daysOfCurrentWeek[indexPath.row])"
            } else {
                cell.dateLabel.text = "Monday "+"\(daysOfSelectedWeek[indexPath.row])"
            }
        case 1:
            if daysOfSelectedWeek.isEmpty {
                cell.dateLabel.text = "Tuesday "+"\(daysOfCurrentWeek[indexPath.row])"
            } else {
                cell.dateLabel.text = "Tuesday "+"\(daysOfSelectedWeek[indexPath.row])"
            }
        case 2:
            if daysOfSelectedWeek.isEmpty {
                cell.dateLabel.text = "Wednesday "+"\(daysOfCurrentWeek[indexPath.row])"
            } else {
                cell.dateLabel.text = "Wednesday "+"\(daysOfSelectedWeek[indexPath.row])"
            }
        case 3:
            if daysOfSelectedWeek.isEmpty {
                cell.dateLabel.text = "Thursday "+"\(daysOfCurrentWeek[indexPath.row])"
            } else {
                cell.dateLabel.text = "Thursday "+"\(daysOfSelectedWeek[indexPath.row])"
            }
        case 4:
            if daysOfSelectedWeek.isEmpty {
                cell.dateLabel.text = "Friday "+"\(daysOfCurrentWeek[indexPath.row])"
            } else {
                cell.dateLabel.text = "Friday "+"\(daysOfSelectedWeek[indexPath.row])"
            }
        case 5:
            if daysOfSelectedWeek.isEmpty {
                cell.dateLabel.text = "Saturday "+"\(daysOfCurrentWeek[indexPath.row])"
            } else {
                cell.dateLabel.text = "Saturday "+"\(daysOfSelectedWeek[indexPath.row])"
            }
        case 6:
            if daysOfSelectedWeek.isEmpty {
                cell.dateLabel.text = "Sunday "+"\(daysOfCurrentWeek[indexPath.row])"
            } else {
                cell.dateLabel.text = "Sunday "+"\(daysOfSelectedWeek[indexPath.row])"
            }
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCollectionViewCell
//        let selectionImage = circleAroundDigit(datesbis[indexPath.item].number, circleColor: .blue,
//                                   digitColor: .white, diameter: 30, font:UIFont(name: "GillSans", size: 20)!)
//        let selectedString = NSMutableAttributedString(string: datesbis[indexPath.item].day)
//        let selectedStringAttachment = NSTextAttachment()
//        selectedStringAttachment.image = selectionImage
//        let selectedImageString = NSAttributedString(attachment: selectedStringAttachment)
//        selectedString.append(selectedImageString)
//        cell.dateLabel.attributedText = selectedString
        
//        dataUpdateDelegate.updateChartBar()
        
        if daysOfSelectedWeek.isEmpty {
            selectedDay = daysOfCurrentWeek[indexPath.row]
        } else {
            selectedDay = daysOfSelectedWeek[indexPath.row]
        }
        
        DashboardViewController.getBusinessData(businessId: 3, timestamp: DashboardViewController.convertDateToTimestamp(day: selectedDay, month: selectedMonth, year: selectedYear), completion: { dataArray in
            var selectedDayData = dataArray
            var timestampArray : [Double] = []
            for data in selectedDayData {
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
            
            
//            Make an array with all data per hour according to opening hours
            var indexData = 0
            var dataPerHour : [BusinessDataModel] = []
            for defaultHour in defaultsOpeningHours {
                if hourArray.contains(defaultHour) {
                    dataPerHour.append(selectedDayData[indexData])
                    indexData += 1
                } else {
                    let emptyData = BusinessDataModel()
                    dataPerHour.append(emptyData)
                }
                }
            print("data per hour \(dataPerHour)")
//            Make an array with only the revenue according to opening hours
            var indexRevenue = 0
            var revenuePerHour : [Double] = []
            for defaultHour in defaultsOpeningHours {
                if hourArray.contains(defaultHour) {
                    revenuePerHour.append(selectedDayData[indexRevenue].totalEarnings)
                    indexRevenue += 1
                } else {
                    revenuePerHour.append(0)
                }
            }
            
            
            //        If we want to make a sales array
            var salesOfSelectedDay : [Sales] = []
            for hour in defaultsOpeningHours {
                let sale = Sales(hour: String(hour), sales: revenuePerHour[hour])
                salesOfSelectedDay.append(sale)
            }
            
            self.dataUpdateDelegate.updateChartBar(xValues: defaultsOpeningHours, yValues: revenuePerHour)
            self.dataUpdateDelegate.sendSelectedDayData(data: dataPerHour)
            
            print(salesOfSelectedDay)
            print("revenueArray \(revenuePerHour)")
        })
        
 
    }
    
    func getCurrentWeek() {
//        let currentMonth = calendar.component(.month, from: date) - 1
//        let components = DateComponents(year: year, month: currentMonth, day: day)
//        guard let currentDate = calendar.date(from: components) else { return }
//        let currentWeekNumber = calendar.component(.weekOfYear, from: currentDate)
        
//        let currentMonth = month
//        let components = DateComponents(year: year, month: currentMonth, day: day)
//        let currentDate = date
        let currentWeekNumber = weekNumber
        
        let startComponents = DateComponents(weekOfYear: currentWeekNumber, yearForWeekOfYear: year)
        let startDate = calendar.date(from: startComponents)!
        let actualStartDate = calendar.date(byAdding: .day, value: 0, to: startDate)!
        
//        let endComponents = DateComponents(day:6, second: -1)
//        let endDate = calendar.date(byAdding: endComponents, to: startDate)!
        
        
//        let actualEndDate = calendar.date(byAdding: .day, value: 2, to: endDate)!
//        let actualRangeBeginning = (calendar.component(.day, from: startDate)+1)
//        let actualRangeEnd = (calendar.component(.day, from: endDate)+1)
        
        daysOfCurrentWeek.append(calendar.component(.day, from: actualStartDate))
        
        var nextDate = actualStartDate
        
//        print(startDate)
//        print("actualStartDate \(actualStartDate)")
//        print(currentDate)
//        print(currentWeekNumber)
//        print(calendar.component(.day, from: startDate))
//        print(calendar.component(.day, from: startDate) - 2)
//        print(calendar.component(.day, from: actualStartDate) - 2)
        
        while daysOfCurrentWeek.count < 7 {
            nextDate = calendar.date(byAdding: .day, value: 1, to: nextDate)!
            daysOfCurrentWeek.append(calendar.component(.day, from: nextDate))
        }
        
//        print(daysOfCurrentWeek)
        
    }
    

    
    
}

extension CalendarView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let view = UIApplication.shared.keyWindow {
            cellWidth = ((view.frame.width - 150) / 7)
//            calendarCollectionView.frame = CGRect(x: 100, y: 71, width: view.frame.width-100, height: calendarHeight)
        }
        return CGSize(width: cellWidth, height: calendarHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CalendarView : CalendarUpdateDelegate {
    func updateSelectedWeek(day: Int, month: Int, year: Int) {
        
        selectedDay = day
        selectedMonth = month
        selectedYear = year
        
        let components = DateComponents(year: year, month: month, day: day)
        guard let selectedDate = calendar.date(from: components) else { return }
        let selectedWeekNumber = calendar.component(.weekOfYear, from: selectedDate)
        let selectedWeekDay = calendar.component(.weekday, from: selectedDate) - 1
        
//        let actualSelectedDate = calendar.date(byAdding: .day, value: 1, to: selectedDate)
        print(selectedDate)
        print("selectedWeekNumber \(selectedWeekNumber)")
        print("selectedWeekDay \(selectedWeekDay)")
//        print(actualSelectedDate)
        
        
        let startComponents = DateComponents(weekOfYear: selectedWeekNumber, yearForWeekOfYear: year)
        let startDate = calendar.date(from: startComponents)!
        
//        let endComponents = DateComponents(day:6, second: -1)
//        let endDate = calendar.date(byAdding: endComponents, to: startDate)!
//
//        print(startDate...endDate)
        
        let actualStartDate = calendar.date(byAdding: .day, value: 0, to: startDate)!
//        let actualEndDate = calendar.date(byAdding: .day, value: 2, to: endDate)!
        
//        print(actualStartDate...actualEndDate)
//        let actualRange = (calendar.component(.day, from: startDate)+1)...(calendar.component(.day, from: endDate)+1)
//        let actualRangeBeginning = (calendar.component(.day, from: startDate)+1)
//        let actualRangeEnd = (calendar.component(.day, from: endDate)+1)
        
//        print(actualRangeBeginning)
//        print(actualRangeEnd)
        
        daysOfSelectedWeek.removeAll()
        daysOfSelectedWeek.append(calendar.component(.day, from: actualStartDate))
        
        var nextDate = actualStartDate
        
        while daysOfSelectedWeek.count < 7 {
            nextDate = calendar.date(byAdding: .day, value: 1, to: nextDate)!
            daysOfSelectedWeek.append(calendar.component(.day, from: nextDate))
        }
        
        print(daysOfSelectedWeek)
        print(date)
        print(weekNumber)
        
        calendarCollectionView.reloadData()
        
        let selectedCellIndexPath = IndexPath.init(row: selectedWeekDay-1, section: 0)
        if selectedWeekDay-1 < 0 {
            calendarCollectionView.selectItem(at: IndexPath.init(row: 6, section: 0), animated: true, scrollPosition: .right)
        } else {
        calendarCollectionView.selectItem(at: selectedCellIndexPath, animated: true, scrollPosition: .right)
        }
        
        print("selected timestamp \(DashboardViewController.convertDateToTimestamp(day: day, month: month, year: year))")
//        Write to code to get the data for the selected date
        var selectedDayData : [BusinessDataModel] = []
        DashboardViewController.getBusinessData(businessId: 3, timestamp: DashboardViewController.convertDateToTimestamp(day: day, month: month, year: year), completion: { dataArray in
            selectedDayData = dataArray
            print(selectedDayData)
            var timestampArray : [Double] = []
            for data in selectedDayData {
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
            
            //            Make an array with all data per hour according to opening hours
            var indexData = 0
            var dataPerHour : [BusinessDataModel] = []
            for defaultHour in defaultsOpeningHours {
                if hourArray.contains(defaultHour) {
                    dataPerHour.append(selectedDayData[indexData])
                    indexData += 1
                } else {
                    let emptyData = BusinessDataModel()
                    dataPerHour.append(emptyData)
                }
            }
            print("data per hour \(dataPerHour)")
            
            var revenuePerHour : [Double] = []
            var indexRevenue = 0
            for defaultHour in defaultsOpeningHours {
                if hourArray.contains(defaultHour) {
                    revenuePerHour.append(selectedDayData[indexRevenue].totalEarnings)
                    indexRevenue += 1
                } else {
                    revenuePerHour.append(0)
                }
            }
            
            
            //        If we want to make a sales array
            var salesOfSelectedDay : [Sales] = []
            for hour in defaultsOpeningHours {
                let sale = Sales(hour: String(hour), sales: revenuePerHour[hour])
                salesOfSelectedDay.append(sale)
            }
            
            
            //        Reloading of the chart with new data
            self.dataUpdateDelegate.updateChartBar(xValues: defaultsOpeningHours, yValues: revenuePerHour)
            self.dataUpdateDelegate.sendSelectedDayData(data: dataPerHour)
           
            print(salesOfSelectedDay)
            print("revenueArray \(revenuePerHour)")
        })
        

  
        
        
//        func dayRangeOf(weekOfYear: Int, for date: Date)
//        {
//            let startComponents = DateComponents(weekOfYear: selectedWeekNumber, yearForWeekOfYear: year)
//            let startDate = calendar.date(from: startComponents)!
//            let endComponents = DateComponents(day:7, second: -1)
//            let endDate = calendar.date(byAdding: endComponents, to: startDate)!
//            print(startDate...endDate)
////
//        }
//
//        dayRangeOf(weekOfYear: 12, for: Date())
    
    }
    
    
        
        
    
        
    }


    
 
    

    
    

