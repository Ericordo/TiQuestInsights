//
//  Credentials.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 09/07/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

enum BusinessList : Int {
    case demoshop = 1
    case tacos = 2
    case cavolinostri = 3
}

struct Credentials {
    let username : String
    let password : String
    let id : Int
    let businessName : String
}

let credentials : [Credentials] = [Credentials(username: "admin", password: "password", id: 1, businessName: "Demo"), Credentials(username: "tacos", password: "tacos", id: 2, businessName: "Taco's"), Credentials(username: "cavolinostri", password: "cavolinostri", id: 3, businessName: "Cavoli Nostri")]



