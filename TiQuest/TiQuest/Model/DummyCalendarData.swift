//
//  DummyCalendarData.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 20/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

struct Dates {
    let dates = ["Monday, 20", "Tuesday 21", "Wednesday 22", "Thursday 23", "Friday 24", "Saturday 25", "Sunday 26", "Monday 27", "Tuesday 28", "Wednesday 29", "Thursday 30", "Friday 31", "Saturday 1", "Sunday 2"]
}

let salesOfMonday20 = [Sales(hour: "11 AM", sales: 453),
                            Sales(hour: "12 AM", sales: 792),
                            Sales(hour: "1 PM", sales: 928),
                            Sales(hour: "2 PM", sales: 832),
                            Sales(hour: "3 PM", sales: 537),
                            Sales(hour: "4 PM", sales: 356),
                            Sales(hour: "5 PM", sales: 328),
                            Sales(hour: "6 PM", sales: 423),
                            Sales(hour: "7 PM", sales: 892),
                            Sales(hour: "8 PM", sales: 958),
                            Sales(hour: "9 PM", sales: 728)]

let salesOfTuesday21 = [Sales(hour: "11 AM", sales: 543),
                       Sales(hour: "12 AM", sales: 620),
                       Sales(hour: "1 PM", sales: 900),
                       Sales(hour: "2 PM", sales: 734),
                       Sales(hour: "3 PM", sales: 482),
                       Sales(hour: "4 PM", sales: 728),
                       Sales(hour: "5 PM", sales: 203),
                       Sales(hour: "6 PM", sales: 517),
                       Sales(hour: "7 PM", sales: 930),
                       Sales(hour: "8 PM", sales: 823),
                       Sales(hour: "9 PM", sales: 623)]


let dates = Dates().dates

let salesOfTheWeek : [String : [Sales]] = ["Monday, 20" : salesOfMonday20,
                                           "Tuesday 21" : salesOfTuesday21,
                                            ]
