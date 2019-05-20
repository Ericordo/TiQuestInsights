//
//  Receipt.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 17/05/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

struct Receipt {
    let date: Date?
    let id : Int?
    let itemList : [Item]?
    let itemAmount : [String : Int]?
    let itemsCost : [String : Double]?
    let subtotal : Double?
    let totalAmount : Double?
    let tax : Double?
    let customers : Int?
}
