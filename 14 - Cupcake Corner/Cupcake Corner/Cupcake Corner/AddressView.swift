//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by hawkeyeshi on 7/6/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.orderInfo.name)
                TextField("Street Address", text: $order.orderInfo.streetAddress)
                TextField("City", text: $order.orderInfo.city)
                TextField("Zip", text: $order.orderInfo.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.orderInfo.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
