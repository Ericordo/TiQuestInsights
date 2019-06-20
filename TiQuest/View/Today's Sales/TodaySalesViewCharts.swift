//
//  TodaySalesViewCharts.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 11/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import UIKit
import Charts

protocol DetailedViewUpdateDelegate {
    func updateDetailedView(key: Int)
}

class TodaySalesChart : BarChartView, ChartViewDelegate {
    
    var detailedViewUpdateDelegate : DetailedViewUpdateDelegate!
    
    
    
//    let salesOfOneDay = [
//        Sales(hour: "0 AM", sales: 453),
//        Sales(hour: "1 AM", sales: 453),
//        Sales(hour: "2 AM", sales: 453),
//        Sales(hour: "3 AM", sales: 453),
//        Sales(hour: "4 AM", sales: 453),
//        Sales(hour: "5 AM", sales: 453),
//        Sales(hour: "6 AM", sales: 453),
//        Sales(hour: "7 AM", sales: 453),
//        Sales(hour: "8 AM", sales: 453),
//        Sales(hour: "9 AM", sales: 453),
//        Sales(hour: "10 AM", sales: 453),
//        Sales(hour: "11 AM", sales: 453),
//        Sales(hour: "12 AM", sales: 792),
//        Sales(hour: "1 PM", sales: 928),
//        Sales(hour: "2 PM", sales: 832),
//        Sales(hour: "3 PM", sales: 543),
//        Sales(hour: "4 PM", sales: 356),
//        Sales(hour: "5 PM", sales: 328),
//        Sales(hour: "6 PM", sales: 423),
//        Sales(hour: "7 PM", sales: 892),
//        Sales(hour: "8 PM", sales: 958),
//        Sales(hour: "9 PM", sales: 728),
//        Sales(hour: "10 PM", sales: 728),
//        Sales(hour: "11 PM", sales: 728)
//    ]
    
    let salesOfOneDay = [
        Sales(hour: "8 AM", sales: 453),
        Sales(hour: "9 AM", sales: 453),
        Sales(hour: "10 AM", sales: 453),
        Sales(hour: "11 AM", sales: 453),
        Sales(hour: "12 AM", sales: 792),
        Sales(hour: "1 PM", sales: 928),
        Sales(hour: "2 PM", sales: 832),
        Sales(hour: "3 PM", sales: 543),
        Sales(hour: "4 PM", sales: 356),
        Sales(hour: "5 PM", sales: 328),
        Sales(hour: "6 PM", sales: 423),
        Sales(hour: "7 PM", sales: 892),
        Sales(hour: "8 PM", sales: 958),
        Sales(hour: "9 PM", sales: 728),
        Sales(hour: "10 PM", sales: 728),
        Sales(hour: "11 PM", sales: 728)
    ]
    
    let salesOfDayTwo = [
        Sales(hour: "8 AM", sales: 400),
        Sales(hour: "9 AM", sales: 400),
        Sales(hour: "10 AM", sales: 400),
        Sales(hour: "11 AM", sales: 453),
        Sales(hour: "12 AM", sales: 792),
        Sales(hour: "1 PM", sales: 928),
        Sales(hour: "2 PM", sales: 832),
        Sales(hour: "3 PM", sales: 500),
        Sales(hour: "4 PM", sales: 500),
        Sales(hour: "5 PM", sales: 328),
        Sales(hour: "6 PM", sales: 423),
        Sales(hour: "7 PM", sales: 892),
        Sales(hour: "8 PM", sales: 958),
        Sales(hour: "9 PM", sales: 728),
        Sales(hour: "10 PM", sales: 728),
        Sales(hour: "11 PM", sales: 728)
    ]
    
    
    
    
    var chartDataSet = BarChartDataSet()
    var chartData = BarChartData()
    
    var openingTimeBusiness = 11
    var closingTimeBusiness = 22
    var openingHours = [Int]()
//    let defaultsOpeningHours = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
    let defaultsOpeningHours = [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
    
    var hours : [String]!
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    

    var forDemo = true
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        axisFormatDelegate = self
        hours = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "00:00"]
        updateOpeningHours()
        setBarData(xValues: defaultsOpeningHours, yValues: salesOfOneDay)
        customizeBarChart()
        print("chart reloaded")
        forDemo = false
        
      
       
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBarData(xValues: [Int], yValues: [Sales]) {
//        1 - Creating an Array of data entries
    
            var data : [BarChartDataEntry] = []
         if !openingHours.isEmpty {
            for i in 0..<salesOfOneDay.count {
                if openingHours.count >= salesOfOneDay.count {
//                let dataEntry = BarChartDataEntry(x: Double(openingHours[i]), y: Double(salesOfOneDay[i].sales))
                let dataEntry = BarChartDataEntry(x: Double(xValues[i]), y: Double(yValues[i].sales))

                data.append(dataEntry)
                } else {
                    let dataEntry = BarChartDataEntry(x: Double(xValues[i]), y: Double(yValues[i].sales))
                    data.append(dataEntry)
                }
            }
         } else {
            for i in 0..<yValues.count {
                let dataEntry = BarChartDataEntry(x: Double(xValues[i]), y: Double(yValues[i].sales))
                
                data.append(dataEntry)
            }
            
        }
        
        
//        2 - Creating a data set with the array
        chartDataSet = BarChartDataSet(entries: data, label: "Sales")
        chartDataSet.setColor(UIColor(red: 229/255, green: 228/255, blue: 233/255, alpha: 1.0))
        chartDataSet.highlightColor = UIColor(red: 51/255, green: 153/255, blue: 248/255, alpha: 1.0)
        chartDataSet.valueTextColor = .black
        chartDataSet.valueFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        
        
      
        
        
        
//        3 - Create Bar Chart Data with our data set
        
        chartData = BarChartData(dataSet: chartDataSet)
        chartData.barWidth = 0.6
        
        
        
        self.xAxis.axisMinimum = Double(defaultsOpeningHours[0]) - 0.5
        self.xAxis.axisMaximum = Double(defaultsOpeningHours[defaultsOpeningHours.count-1]) + 0.5
        
        xAxis.valueFormatter = axisFormatDelegate
        
//        if openingHours.isEmpty {
//            self.xAxis.axisMinimum = Double(defaultsOpeningHours[0]) - 0.5
//            self.xAxis.axisMaximum = Double(defaultsOpeningHours[defaultsOpeningHours.count-1]) + 0.5
//        } else {
//            self.xAxis.axisMinimum = Double(openingHours[0]) - 0.5
//            self.xAxis.axisMaximum = Double(openingHours[openingHours.count-1]) + 0.5
//        }
       
        
        
        
//        4 - Set our Bar Chart Data
//        If self.date is empty it will display "No data available"
        self.data = chartData
        self.notifyDataSetChanged()
        
    }
    
    func customizeBarChart() {
        self.noDataText = "No data available"
//        self.chartDescription?.text = "Sales"
        self.xAxis.labelPosition = .top
//        self.chartDescription?.textColor = UIColor.black
        self.gridBackgroundColor = UIColor.white
        self.drawGridBackgroundEnabled = false
        self.leftAxis.enabled = true
        self.xAxis.labelPosition = .bottom
        self.animate(yAxisDuration: 2 ,easingOption: .easeInOutQuart)
        self.xAxis.gridColor = .clear
        self.rightAxis.gridColor = .clear
        self.leftAxis.gridColor = UIColor(white: 0, alpha: 0.1)
        self.xAxis.labelCount = salesOfOneDay.count
        self.fitBars = true
        self.legend.enabled = false
        self.leftAxis.drawLabelsEnabled = false
        self.leftAxis.drawAxisLineEnabled = false
        self.rightAxis.drawLabelsEnabled = false
        self.rightAxis.drawAxisLineEnabled = false
        self.doubleTapToZoomEnabled = false
        self.pinchZoomEnabled = false
        self.setScaleEnabled(false)
        self.dragEnabled = false
        self.drawValueAboveBarEnabled = true
        self.xAxis.labelFont = UIFont.systemFont(ofSize: 15)
        self.xAxis.labelTextColor = UIColor.black
        
        
        
        
//        self.xAxis.centerAxisLabelsEnabled = true
//        self.xAxis.spaceMin = 0.5
//        self.xAxis.spaceMax = 0.5
//        self.xAxis.granularityEnabled = true
//        self.xAxis.granularity = 1
        
        
        
        
        
  
        
    }
    
//    let blockWidth = self.frame.width / 11
//    let barWidthInPx = 0.60 * blockWidth
//    let spaceWidthInPx = 0.40 * blockWidth
    
    @objc func chartValueSelected(_ chartView: Charts.ChartViewBase, entry: Charts.ChartDataEntry, highlight: Charts.Highlight) {
        print("HELLO")
        detailedViewUpdateDelegate.updateDetailedView(key: Int(highlight.x))

        
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        detailedViewUpdateDelegate.updateDetailedView(key: 24)
    }
    
    func updateOpeningHours() {
        openingHours = []
        if defaults.integer(forKey: "openingTimeBusiness") >= defaults.integer(forKey: "closingTimeBusiness") {
            print("ERROR")
        } else {
        
            for hour in defaults.integer(forKey: "openingTimeBusiness")...defaults.integer(forKey: "closingTimeBusiness") {
                openingHours.append(hour)
            }
            openingHours.removeLast()
            defaults.setValue(openingHours, forKey: "openingHours")
            
        

            
        }
            
            
       
        
        print(openingHours)
    }
    
    
    
//    func printTest() {
//        self.animate(yAxisDuration: 2 ,easingOption: .easeInOutQuart)
////        self.notifyDataSetChanged()
////        chartDataSet.notifyDataSetChanged()
////        chartData.notifyDataChanged()
////        self.animate(yAxisDuration: 1.0)
//
//
//    }
    
    
}

extension TodaySalesChart: DataUpdateDelegate {
    func updateChartBar() {
        
        if forDemo == false {
            self.setBarData(xValues: defaultsOpeningHours, yValues: salesOfOneDay)
            self.animate(yAxisDuration: 1 ,easingOption: .easeInOutQuart)
            forDemo = true
        }
        
        if forDemo == true {
        self.setBarData(xValues: defaultsOpeningHours, yValues: salesOfDayTwo)
        self.animate(yAxisDuration: 1 ,easingOption: .easeInOutQuart)
        forDemo = false
        }
  
    }
}

extension TodaySalesChart: OpeningTimeUpdateDelegate {
    func updateOpeningTime() {
        openingTimeBusiness = defaults.integer(forKey: "openingTimeBusiness")
        print("delegate open \(openingTimeBusiness)")
        updateOpeningHours()
       
        
        self.notifyDataSetChanged()
        chartDataSet.notifyDataSetChanged()
        chartData.notifyDataChanged()
        print(openingHours)
    }
    
    
}

extension TodaySalesChart: ClosingTimeUpdateDelegate {
    func updateClosingTime() {
        closingTimeBusiness = defaults.integer(forKey: "closingTimeBusiness")
        print("delegate closing \(closingTimeBusiness)")
        updateOpeningHours()
       
        self.notifyDataSetChanged()
        chartDataSet.notifyDataSetChanged()
        chartData.notifyDataChanged()
        print(openingHours)
        self.setBarData(xValues: defaultsOpeningHours, yValues: salesOfDayTwo)
     
    }
    
    
}

extension TodaySalesChart: IAxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return hours[Int(value)]
    }
}

