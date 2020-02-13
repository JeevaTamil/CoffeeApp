//
//  OrderModel.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 08/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let coffeeName: String
    let total: Double
    let size: String
    
}

