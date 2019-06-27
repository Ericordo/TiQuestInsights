//
//  OpeningHoursValidation.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 25/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

struct OpeningHoursValidation {
    var openingTime : Int
    var closingTime : Int
    
    func validateOpeningHours() -> Bool {
        if openingTime < closingTime {
            return true
        } else {
            return false
        }
    }
}

var openingHoursValidation = OpeningHoursValidation(openingTime: 0, closingTime: 24)





