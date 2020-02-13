//
//  OrdersView.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 08/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import SwiftUI

struct OrdersView: View {
    
    let orders: [OrderVM]
    
    init(orders: [OrderVM]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(self.orders, id: \.id) { order in
                HStack {
                    
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)
                    
                    VStack(alignment: .leading) {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        
                        HStack {
                            Text(order.coffeeName)
                            Text(order.size)
                        }
                        .foregroundColor(.secondary)
                        .padding([.leading], 10)
                    }
                }
            }
        }  
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView(orders: [OrderVM(order: Order(name: "Jeeva", coffeeName: "Cappuccino", total: 20, size: "Medium"))])
    }
}
