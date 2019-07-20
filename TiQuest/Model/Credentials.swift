//
//  Credentials.swift
//  TiQuest
//
//  Created by Eric Ordonneau on 09/07/2019.
//  Copyright © 2019 Eric Ordonneau. All rights reserved.
//

import Foundation

//let credentials : [String : String] = ["admin" : "password", "tacos" : "tacos", "cavolinostri" : "cavolinostri"]

struct Credentials {
    let username : String
    let password : String
    let id : Int
    let businessName : String
}

let credentials : [Credentials] = [Credentials(username: "admin", password: "password", id: 1, businessName: "Demo"), Credentials(username: "tacos", password: "password", id: 2, businessName: "Tacos"), Credentials(username: "cavolinostri", password: "cavolinostri", id: 3, businessName: "Cavoli Nostri")]



