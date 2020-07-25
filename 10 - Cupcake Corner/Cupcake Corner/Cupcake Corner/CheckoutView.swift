//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by hawkeyeshi on 7/6/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    // challenge two - provide informative error messages to user
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.95)
                        .cornerRadius(20)
                    
                    Text("Your total is $\(self.order.orderInfo.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order.orderInfo) else {
            print("Failed tot encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                self.showingAlert.toggle()
                self.alertTitle = "Error"
                self.alertMessage = "\(error?.localizedDescription ?? "Unknown error")"
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(OrderInfo.self, from: data) {
                self.alertTitle = "Thank you!"
                self.alertMessage = "Your order for \(decodedOrder.quantity)x \(OrderInfo.types[decodedOrder.type].lowercased()) is on its way!"
                self.showingAlert.toggle()
            } else {
                self.alertTitle = "Error"
                self.alertMessage = "Invalid response from server"
                self.showingAlert.toggle()
            }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
