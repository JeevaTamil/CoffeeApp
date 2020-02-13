//
//  CofeeModel.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 08/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 20),
            Coffee(name: "Expresso", imageURL: "Expresso", price: 15),
            Coffee(name: "Regular", imageURL: "Regular", price: 10)
        ]
    }
    
}
