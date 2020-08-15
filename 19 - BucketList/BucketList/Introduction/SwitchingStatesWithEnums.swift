//
//  ContentView.swift
//  BucketList
//
//  Created by hawkeyeshi on 8/14/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct SwitchingStatesWithEnums: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    var loadingState = LoadingState.loading
    
    var body: some View {
        Group {
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else {
                FailedView()
            }
        }
    }
}

struct LoadingView: View {
    @State private var animation: CGFloat = 1.1
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<3) { _ in
                    Circle()
                        .frame(width: 15, height: 15)
                        .padding(3)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .scaleEffect(self.animation)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true)
                    )
                }
            }
            Text("Loading...")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.blue)
        }
        .onAppear {
            self.animation = 1.5
        }
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
            .font(.system(size: 20, weight: .semibold))
            .padding()
            .foregroundColor(.white)
            .background(Color(#colorLiteral(red: 0.03107913852, green: 0.7149627221, blue: 0.3153975864, alpha: 1)))
            .cornerRadius(10)
    }
}

struct FailedView: View {
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle")
            
            Text("Loading Failed.")
        }
        .font(.system(size: 20, weight: .semibold))
        .padding()
        .foregroundColor(.white)
        .background(Color(#colorLiteral(red: 0.8217203363, green: 0.08726235932, blue: 0.04279081388, alpha: 1)))
        .cornerRadius(10)
    }
}

struct SwitchingStatesWithEnums_Previews: PreviewProvider {
    static var previews: some View {
        SwitchingStatesWithEnums()
    }
}
