//
//  DummyJson.swift
//  TiQuest
//
//  Created by Anton C on 03/06/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation



struct MenuItems: Codable {
    var data: [MenuItem]
}

struct MenuItem: Codable {
    var id: Int
    var name: String
    var price: Double
    var profit: Double
    var category: String
    var subcategory: String
}

let jsonString = """
{
  "data":[
    {
    "id": 1,
    "name": "Cheeseburger",
    "price": 9.50,
    "profit": 2.20,
    "category": "Main",
    "subcategory": "Burger"
    },
    {
    "id": 2,
    "name": "Margherita",
    "price": 6.70,
    "profit": 3.10,
    "category": "Starters",
    "subcategory": "Pizza"
    },
    {
    "id": 3,
    "name": "Red Wine",
    "price": 3.00,
    "profit": 1.00,
    "category": "Alcohol",
    "subcategory": "Wine"
    },
    {
   "id": 4,
   "name": "White Wine",
   "price": 3.00,
   "profit": 1.10,
   "category": "Alcohol",
   "subcategory": "Wine"
   },
   {
   "id": 5,
   "name": "Beer",
   "price": 4.00,
   "profit": 1.10,
   "category": "Alcohol",
   "subcategory": "Beer"
   },
   {
   "id": 6,
   "name": "Coke",
   "price": 2.50,
   "profit": 0.50,
   "category": "Beverages",
   "subcategory": "Soda"
   },
   {
   "id": 7,
   "name": "Fanta",
   "price": 2.50,
   "profit": 0.40,
   "category": "Beverages",
   "subcategory": "Soda"
   },
   {
   "id": 8,
   "name": "Greek Salad",
   "price": 12.60,
   "profit": 2.30,
   "category": "Starters",
   "subcategory": "Salad"
   },
   {
   "id": 9,
   "name": "Caprese",
   "price": 9.60,
   "profit": 3.20,
   "category": "Starters",
   "subcategory": "Salad"
   },
   {
   "id": 10,
   "name": "Panna Cotta",
   "price": 4.30,
   "profit": 2.30,
   "category": "Desserts",
   "subcategory": "Sweet"
   },
   {
   "id": 11,
   "name": "Chocolate Ice cream",
   "price": 3.30,
   "profit": 1.00,
   "category": "Desserts",
   "subcategory": "Icecream"
   },
   {
   "id": 12,
   "name": "Carbonara",
   "price": 8.90,
   "profit": 1.50,
   "category": "Starters",
   "subcategory": "Pasta"
   },
   {
   "id": 13,
   "name": "Bolognese",
   "price": 9.50,
   "profit": 1.30,
   "category": "Starters",
   "subcategory": "Pasta"
   }
  ]
}
"""
