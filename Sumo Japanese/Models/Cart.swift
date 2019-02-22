//
//  Cart.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/18/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import Foundation

struct Cart:Codable {
    var numItems: Int = 0
    var total: Double = 0
    var items: [Item] = []
}
