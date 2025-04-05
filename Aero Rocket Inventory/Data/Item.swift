//
//  Item.swift
//  Aero Rocket Inventory
//
//  Created by macbook on 4/2/25.
//

import SwiftUI

struct Item: Identifiable {
    var id: String
    var name: String
    var quantity: Int
    var count_date: String
    var count_person: String
    var delivery_date: String
    var location: Array<String>
    var supplier: String
    var retail_price: Int
}
