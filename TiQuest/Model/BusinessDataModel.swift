//
//  BusinessDataModel.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 25/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation


class Category {
    var id: Int = 0
    var title: String = ""
    var iconUrl: String = ""
}

class ProductModel {
    var id: Int = 0
    var title: String = ""
    var category: Category = Category()
    var iconUrl: String = ""
    var counter: Int = 0
}

class Weather {
    var datetime: Double = 0
    var temperature: Double = 0
    var condition: Double = 0
}

class BusinessDataModel {
    var datetime: Double = 0
    var totalEarnings: Double = 0
    var totalOrders: Double = 0
    var averageOrderValue: Double = 0
    var soldProducts: [BusinessProductInfo] = []

    var weather: Weather = Weather()
}
