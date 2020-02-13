//
//  TotalView.swift
//  Coffee
//
//  Created by Azhagusundaram Tamil on 13/02/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import SwiftUI

struct TotalView: View {
    
    var total: Double
    
    var body: some View {
        
        HStack {
            Spacer()
            Text(String(format: "$%.2f", total)).font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
            Spacer()
        }
        
        
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView(total: 2.45)
    }
}
