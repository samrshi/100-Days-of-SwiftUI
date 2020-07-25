//
//  RectangeColorView.swift
//  Drawing
//
//  Created by hawkeyeshi on 6/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                RoundedRectangle(cornerRadius: 30)
                    .inset(by: CGFloat(value))
                .fill(LinearGradient(gradient:
                    Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom))
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct RectangleColorView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)
                .padding()
            
            Slider(value: $colorCycle)
            
            Spacer()
        }
    .navigationBarTitle("Color Cycling Rectangle")
    }
}

struct RectangleColorView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleColorView()
    }
}
