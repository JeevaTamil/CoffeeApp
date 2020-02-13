//
//  AddCoffeeOrderVIewModel.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 09/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import Foundation

class AddCoffeeOrderVM : ObservableObject  {
    
    var webservice: Webservice
    
    init() {
        self.webservice = Webservice()
    }
    
    var name: String = ""
    @Published var coffeeName: String = ""
    @Published var size: String = "Medium"
   
    var total: Double {
        return calculateTotalPrice()
    }
    
    var coffeeList: [CoffeeVM] {
       return Coffee.all().map(CoffeeVM.init)
    }
    
    func placeOrder() {
        let order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
        
        self.webservice.createOrder(order: order) { (orderResponse) in
            guard let orderResponse = orderResponse else {
                fatalError("Something went wrong")
            }
            
            if orderResponse.success {
                print("Order successfully placed")
            }
        }
    }
    
    private func priceForSize() -> Double {
        let price = ["Small": 1.0, "Medium": 2.0, "Large": 3.0]
        return price[self.size]!
    }
    
    private func calculateTotalPrice () -> Double {
        let coffeeVM = coffeeList.first{ $0.name == self.coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}

