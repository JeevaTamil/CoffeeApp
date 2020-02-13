//
//  OrderListVM.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 08/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import Foundation
import Combine

class OrderListVM: ObservableObject {
    
    @Published var orders = [OrderVM]()
    
    init() {
        getAllOrders()
    }
    
    func getAllOrders() {
        Webservice().getAllOrder { (orders) in
            if let orderList = orders {
                self.orders = orderList.map(OrderVM.init)
            }
        }
    }
    
    
    
}


class OrderVM {
    
    let id = UUID()
    
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    
    var size : String {
        return  self.order.size
    }
    
    var total: Double {
        return self.order.total
    }
    
}
