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
// To test with this calendar (where Monday is the first day of the week and not Sunday)
//let calendar = Calendar(identifier: .iso8601)


// This according to GMT so we need a DateFormatter to be in the right time zone
// https://stackoverflow.com/questions/51397856/why-the-result-of-my-date-object-always-several-hours-behind-the-actual-string-t?noredirect=1&lq=1
let day = calendar.component(.day, from: date)
var weekday = calendar.component(.weekday, from: date) - 1
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)
var weekNumber = calendar.component(.weekOfYear, from: date)


var yearForWeekNumber = calendar.component(.yearForWeekOfYear, from: date)

let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]




