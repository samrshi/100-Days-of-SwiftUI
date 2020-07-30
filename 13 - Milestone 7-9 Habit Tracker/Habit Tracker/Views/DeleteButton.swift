//
//  DeleteButton.swift
//  Habit Tracker
//
//  Created by hawkeyeshi on 7/3/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct DeleteButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Image(systemName: "trash")
                Text("Clear All")
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .buttonStyle(PlainButtonStyle())
        .transition(.asymmetric(insertion: .scale, removal: .scale))
    }
}
