//
//  ContentView.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 08/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orders = OrderListVM()
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            OrdersView(orders: self.orders.orders)
                .navigationBarTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action:{
                    self.fetchOrders()
                }){
                    Image(systemName: "arrow.clockwise")
                    }, trailing: Button(action:{
                        self.showSheet = true
                    }){
                        Image(systemName: "plus")
                })
                
                .sheet(isPresented: self.$showSheet) {
                    AddCoffeeOrderView()
            }.onDisappear {
                 self.orders.getAllOrders()
            }
        }
    }
    
    private func fetchOrders() {
        self.orders.getAllOrders()
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
