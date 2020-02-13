//
//  Webservicw.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 08/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import Foundation

class Webservice {
    
    
    func getAllOrder(complition: @escaping ([Order]?) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            DispatchQueue.main.async {
                complition(nil)
            }
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    complition(nil)
                }
                fatalError("Something went wrong")
            }
            
            
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            
            DispatchQueue.main.async {
                complition(orders)
            }
            
        }.resume()
    }
    
    func createOrder(order: Order, complition: @escaping (CreateOrderResponse?) -> ()) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            DispatchQueue.main.async {
                complition(nil)
            }
            fatalError("Invalid URL")
        }
        
        var urlReq = URLRequest(url: url)
        urlReq.httpMethod = "POST"
        urlReq.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlReq.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: urlReq) { (data, response, error) in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    complition(nil)
                }
                return
            }
            
            let response = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            
            DispatchQueue.main.async {
                complition(response)
            }
        }.resume()
        
    }
    
    
}
