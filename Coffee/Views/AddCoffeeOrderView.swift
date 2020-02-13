//
//  AddCoffeeOrderView.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 09/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderVM()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            VStack{
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter Your Name", text: self.$addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(self.addCoffeeOrderVM.coffeeList, id: \.name ) { coffee in
                            CoffeeCellView(coffee: coffee, selectedCoffee: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT SIZE").font(.body), footer: TotalView(total: self.addCoffeeOrderVM.total).padding(.top, 20)) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    
                    
                    HStack(alignment: .center){
                        Spacer()
                        Button(action: {
                            self.addCoffeeOrderVM.placeOrder()
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            
                            Text("Place Order")
                                .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(10)
                            
                        }
                        Spacer()
                    }
                    
                }
            }
        .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}

struct CoffeeCellView: View {
    
    var coffee : CoffeeVM
    @Binding var selectedCoffee: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(.infinity)
            Text(coffee.name)
                .padding([.leading], 10)
            Spacer()
            Image(systemName: self.selectedCoffee == coffee.name ? "checkmark": "")
        }.onTapGesture {
            self.selectedCoffee = self.coffee.name
        }
    }
}
