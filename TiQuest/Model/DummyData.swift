//
//  DummyData.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 17/05/2019.
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



//let cheeseburger = Item.init(name: "Cheeseburger", id: 1, price: 9.50, category: "burger", subcategory: "", profit: 2.20)
//let margherita = Item.init(name: "Margherita", id: 2, price: 6.70, category: "pizza", subcategory: "main", profit: 3.10)
//let redWine = Item.init(name: "Red wine", id: 3, price: 3.00, category: "alcohol", subcategory: "wine", profit: 1.00)
//let whiteWine = Item.init(name: "White wine", id: 4, price: 3.00, category: "alcohol", subcategory: "wine", profit: 1.10)
//let beer = Item.init(name: "Beer", id: 5, price: 4.00, category: "alcohol", subcategory: "wine", profit: 1.20)
//let coke = Item.init(name: "Coke", id: 6, price: 2.50, category: "beverage", subcategory: "soda", profit: 0.50)
//let fanta = Item.init(name: "Fanta", id: 7, price: 2.50, category: "beverage", subcategory: "soda", profit: 0.40)
//let greekSalad = Item.init(name: "Greek Salad", id: 8, price: 12.60, category: "salad", subcategory: "starter", profit: 2.30)
//let tomateMoza = Item.init(name: "Tomato Mozarella", id: 9, price: 9.60, category: "salad", subcategory: "starter", profit: 3.20)
//let pannaCotta = Item.init(name: "Panna Cotta", id: 10, price: 4.30, category: "sweet", subcategory: "dessert", profit: 2.30)
//let chocolateIceCream = Item.init(name: "Chocolate Ice cream", id: 11, price: 3.30, category: "icecream", subcategory: "dessert", profit: 1.00)
//let bruschetta = Item.init(name: "Bruschetta", id: 11, price: 5.60, category: nil, subcategory: "starter", profit: 2.30)
//let pastaCabonara = Item.init(name: "Carbonara", id: 12, price: 8.90, category: "pasta", subcategory: "main", profit: 1.50)
//let pastaBolognese = Item.init(name: "Bolognese", id: 13, price: 9.50, category: "pasta", subcategory: "main", profit: 1.30)
//
//struct Menu {
//    let cheeseburger = Item.init(name: "Cheeseburger", id: 1, price: 9.50, category: "burger", subcategory: "main", profit: 2.20)
//    let margherita = Item.init(name: "Margherita", id: 2, price: 6.70, category: "pizza", subcategory: "main", profit: 3.10)
//    let redWine = Item.init(name: "Red wine", id: 3, price: 3.00, category: "alcohol", subcategory: "wine", profit: 1.00)
//    let whiteWine = Item.init(name: "White wine", id: 4, price: 3.00, category: "alcohol", subcategory: "wine", profit: 1.10)
//    let beer = Item.init(name: "Beer", id: 5, price: 4.00, category: "alcohol", subcategory: "wine", profit: 1.20)
//    let coke = Item.init(name: "Coke", id: 6, price: 2.50, category: "beverage", subcategory: "soda", profit: 0.50)
//    let fanta = Item.init(name: "Fanta", id: 7, price: 2.50, category: "beverage", subcategory: "soda", profit: 0.40)
//    let greekSalad = Item.init(name: "Greek Salad", id: 8, price: 12.60, category: "salad", subcategory: "starter", profit: 2.30)
//    let tomateMoza = Item.init(name: "Tomato Mozarella", id: 9, price: 9.60, category: "salad", subcategory: "starter", profit: 3.20)
//    let pannaCotta = Item.init(name: "Panna Cotta", id: 10, price: 4.30, category: "sweet", subcategory: "dessert", profit: 2.30)
//    let chocolateIceCream = Item.init(name: "Chocolate Ice cream", id: 11, price: 3.30, category: "icecream", subcategory: "dessert", profit: 1.00)
//    let bruschetta = Item.init(name: "Bruschetta", id: 11, price: 5.60, category: nil, subcategory: "starter", profit: 2.30)
//    let pastaCabonara = Item.init(name: "Carbonara", id: 12, price: 8.90, category: "pasta", subcategory: "main", profit: 1.50)
//    let pastaBolognese = Item.init(name: "Bolognese", id: 13, price: 9.50, category: "pasta", subcategory: "main", profit: 1.30)
//}
//
//let menu = Menu()

//let receipt1 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//
//let receipt2 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//
//let receipt3 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//
//let receipt4 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//
//let receipt5 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//let receipt6 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//let receipt7 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//
//let receipt8 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//
//let receipt9 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)
//
//let receipt10 = Receipt.init(date: Date(), id: 1, itemList: [menu.cheeseburger, menu.pannaCotta, menu.beer, menu.bruschetta, menu.cheeseburger, menu.beer, menu.bruschetta, menu.pastaBolognese, menu.redWine, menu.pastaCabonara, menu.beer], itemAmount: [menu.cheeseburger.name! : 3, menu.pannaCotta.name! : 1, menu.beer.name! : 3, menu.bruschetta.name! : 2, menu.pastaBolognese.name! : 1, menu.redWine.name! : 1, menu.pastaCabonara.name! : 1], itemsCost: [menu.cheeseburger.name! : 28.50, menu.pannaCotta.name! : 2.30, menu.beer.name! : 12.00, menu.bruschetta.name! : 11.20, menu.pastaBolognese.name! : 9.50, menu.redWine.name! : 3, menu.pastaCabonara.name! : 8.90], subtotal: 75, totalAmount: 80, tax: nil, customers: 4)



// MARK: - Possible way to deal with the date:
//let formatter = DateFormatter()
//formatter.dateFormat = "yyyy/MM/dd HH:mm"
//let someDateTime = formatter.date(from: "2016/10/08 22:31")
