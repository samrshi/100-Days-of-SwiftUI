//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by hawkeyeshi on 6/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var flagText: String
    
    var body: some View {
        Image(flagText)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule()
                .stroke(Color.white, lineWidth: 3))
            .padding(10)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var correctRotationAmount = 0.0
    @State private var opacityAmounts = Array(repeating: 1.0, count: 3)
    @State private var wrongRotationAmounts = Array(repeating: 0.0, count: 3)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Spacer()
                
                Spacer()
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                    
                    ForEach(0 ..< 3, id: \.self) { number in
                        
                        Button(action: {
                            self.flagTapped(number)
                        }) {
                            FlagImage(flagText: self.countries[number])
                        }
                        .opacity(self.opacityAmounts[number])
                        .rotation3DEffect(.degrees(number == self.correctAnswer ? self.correctRotationAmount : 0.0), axis: (x: 0, y: 1, z: 0))
                        .rotation3DEffect(.degrees(self.wrongRotationAmounts[number]), axis: (x: 0, y: 1, z: 0))
                    }
                    
                    Spacer()
                }
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message:
                    Text("Your Score is \(score)"),
                      dismissButton: .default(Text("Continue")) {
                        self.askQuestion()
                    })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
            correctRotationAmount = 0
            
            for number in 0 ..< opacityAmounts.count {
                opacityAmounts[number] = number != correctAnswer ? 0.25 : 1.0
            }
            
            withAnimation(.interpolatingSpring(stiffness: 20, damping: 5)) {
                self.correctRotationAmount = 360.0
            }
        } else {
            scoreTitle = "Wrong! Thats the flag of \(countries[number])"
            withAnimation(.interpolatingSpring(mass: 1, stiffness: 120, damping: 40, initialVelocity: 200)) {
                self.wrongRotationAmounts[number] = 2
            }
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
        correctRotationAmount = 0
        opacityAmounts = Array(repeating: 1.0, count: 3)
        wrongRotationAmounts = Array(repeating: 0.0, count: 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
