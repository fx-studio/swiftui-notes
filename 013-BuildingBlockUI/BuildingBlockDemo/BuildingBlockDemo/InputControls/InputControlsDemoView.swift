//
//  InputControlsDemoView.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/21/21.
//

import SwiftUI

struct InputControlsDemoView: View {
    
    @State var amount: Double = 0
    @State var quantity = 0.0
    
    var body: some View {
        VStack {
            // Slider
            VStack {
                HStack {
                    Text("0")
                    Slider(
                        value: $amount,
                        in: 0.0 ... 10.0,
                        step: 0.5
                    )
                    Text("10")
                }
                Text("\(amount)")
            }
            
            //Stepper
            VStack {
                Stepper(
                  "Quantity: \(quantity)",
                  value: $quantity,
                  in: 0 ... 10,
                  step: 0.5
                )
            }
        }
        .padding()
    }
}

struct InputControlsDemoView_Previews: PreviewProvider {
    static var previews: some View {
        InputControlsDemoView()
    }
}
