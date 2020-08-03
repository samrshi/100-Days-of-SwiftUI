//
//  AnimatingGetures.swift
//  Animations
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct AnimatingGetures: View {
    @State private var dragAmountCard = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmountLetters = CGSize.zero
    
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmountCard)
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmountCard = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                self.dragAmountCard = .zero
                            }
                    }
            )
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(self.enabled ? Color.blue : Color.red)
                        .offset(self.dragAmountLetters)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmountLetters = $0.translation }
                    .onEnded { _ in
                        self.dragAmountLetters = .zero
                        self.enabled.toggle()
                    }
            )
        }
    }
}

struct AnimatingGetures_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGetures()
    }
}
