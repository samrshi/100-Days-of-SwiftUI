//
//  Order.swift
//  Cupcake Corner
//
//  Created by hawkeyeshi on 7/8/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

// challenge 3

class Order: ObservableObject {
    @Published var orderInfo: OrderInfo = OrderInfo()
}

struct OrderInfo: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        // challenge 1 - make Address fields disabled if the strings are only whitespace or empty
        let nameTrimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let streetAddressTrimmed = streetAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        let cityTrimmed = city.trimmingCharacters(in: .whitespacesAndNewlines)
        let zipTrimmed = zip.trimmingCharacters(in: .whitespacesAndNewlines)

        if nameTrimmed.isEmpty || streetAddressTrimmed.isEmpty || cityTrimmed.isEmpty || zipTrimmed.isEmpty {
            return false
        }

        return true
    }
    
    var cost: Double {
        var cost = Double(quantity * 2)
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
