//
//  CalendarData.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 14/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
let weekday = calendar.component(.weekday, from: date)
let month = calendar.component(.month, from: date)
let year = calendar.component(.year, from: date)
let weekNumber = calendar.component(.weekOfYear, from: date)

