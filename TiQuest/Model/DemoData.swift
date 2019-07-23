//
//  DemoData.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 26/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

struct Sales {
    var hour: String
    var sales: Double
}

struct dailySales {
    var day: String
    var totalSales: [Sales]
}

// Put Fake Data for Demo Version

let salesOfDayOne = [
    Sales(hour: "0 AM", sales: 453),
    Sales(hour: "1 AM", sales: 453),
    Sales(hour: "2 AM", sales: 453),
    Sales(hour: "3 AM", sales: 453),
    Sales(hour: "4 AM", sales: 453),
    Sales(hour: "5 AM", sales: 453),
    Sales(hour: "6 AM", sales: 453),
    Sales(hour: "7 AM", sales: 453),
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
    Sales(hour: "0 AM", sales: 453),
    Sales(hour: "1 AM", sales: 453),
    Sales(hour: "2 AM", sales: 453),
    Sales(hour: "3 AM", sales: 453),
    Sales(hour: "4 AM", sales: 453),
    Sales(hour: "5 AM", sales: 453),
    Sales(hour: "6 AM", sales: 453),
    Sales(hour: "7 AM", sales: 453),
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

