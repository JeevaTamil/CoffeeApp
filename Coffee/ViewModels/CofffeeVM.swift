//
//  CofffeeVM.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 09/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import Foundation


class CofeeListVM {
    var coffeeList : [CoffeeVM] = [CoffeeVM]()
}

class CoffeeVM {
    
    var coffee : Coffee
    
    init(coffee: Coffee ) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var price: Double {
        return self.coffee.price
    }
    
    var imageURL: String {
        return self.coffee.imageURL
    }
    
}
