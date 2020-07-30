//
//  Challenge.swift
//  Drawing
//
//  Created by hawkeyeshi on 6/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct Arrow: InsettableShape {
    var rectanglePercent: Double = 1/6
    var insetAmount: CGFloat = 0
    
    var animatableData: Double {
        get { rectanglePercent }
        set { self.rectanglePercent = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let rectangleWidth: CGFloat = rect.width * CGFloat(rectanglePercent)
        let triangleBase = rectangleWidth * 3
        
        var path = Path()
        
        // rectangle start
        path.move(to: CGPoint(x: rect.midX - (rectangleWidth / 2), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + (rectangleWidth / 2), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + (rectangleWidth / 2), y: rect.minY + rect.height / 3))
        
        // triangle
        path.addLine(to: CGPoint(x: rect.midX + (triangleBase / 2), y: rect.minY + rect.height / 3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX - (triangleBase / 2), y: rect.minY + rect.height / 3))
        
        // rectange finish
        path.addLine(to: CGPoint(x: rect.midX - (rectangleWidth / 2), y: rect.minY + rect.height / 3))
        path.addLine(to: CGPoint(x: rect.midX - (rectangleWidth / 2), y: rect.maxY))
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ArrowView: View {
    @State private var arrowLineWidth: CGFloat = 4
    @State private var arrowHeight: CGFloat = 400
    @State private var arrowWidth: CGFloat = 400
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(Color.primary, style: StrokeStyle(lineWidth: self.arrowLineWidth, lineCap: .round, lineJoin: .round))
                .frame(width: self.arrowWidth, height: self.arrowHeight)
                .padding(.vertical)
            
            Text("Arrow Height:")
            Slider(value: self.$arrowHeight, in: 1...450)
                .padding(.horizontal)
            
            Text("Arrow Width:")
            Slider(value: self.$arrowWidth, in: 100...450)
                .padding(.horizontal)
            
            Button("Change Border Size") {
                withAnimation(.easeIn(duration: 1)) {
                    self.arrowLineWidth = self.arrowLineWidth == 4 ? 15 : 4
                }
            }
            .modifier(ButtonStyle())
            
            Spacer()
        }
        .navigationBarTitle("Arrow")
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.primary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
