//
//  CalculatorButton.swift
//  MultiplicationTables
//
//  Created by hawkeyeshi on 6/14/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct CalculatorButton: View {
    var value: String
    var action: (String) -> Void
    
    var body: some View {
        
        
        Button(action: {
            self.action(self.value)
        }) {
            Text(value)
                .font(.system(size: 50, weight: .black, design: .default))                .fontWeight(.black)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .foregroundColor(.black)
        }
        
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(value: "1", action: {_ in })
    }
}
