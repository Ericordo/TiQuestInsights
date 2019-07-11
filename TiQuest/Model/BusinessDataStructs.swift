//
//  BusinessDataStructs.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 25/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

public struct BusinessCategory : Codable {
    var id: Int?
    var title: String?
    var iconUrl: String?
}

public struct BusinessProductModel : Codable {
    var id: Int?
    var title: String?
    var category: BusinessCategory?
    var iconUrl: String?
}

public struct BusinessProductInfo : Codable {
    var product: BusinessProductModel?
    var counter: Int?
}

//public struct BusinessWeather : Codable {
//    var datetime: Double?
//    var temperature: Double?
//    var condition: Double?
//}

public struct BusinessHourData : Codable {
    var datetime: Double?
    var totalEarnings: Double?
    var totalOrders: Double?
    var averageOrderValue: Double?
    var soldProducts: [BusinessProductInfo]?
//    var weather: BusinessWeather?
}

public struct BusinessDayData : Codable {
    var dayData: [BusinessHourData]
}





