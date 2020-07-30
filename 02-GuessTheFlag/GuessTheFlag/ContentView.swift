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
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        
        .padding(10)    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("Score: \(score)")
                        .foregroundColor(.white)

                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.flagTapped(number)
                        }) {
                            FlagImage(flagText: self.countries[number])
                        }
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
        } else {
            scoreTitle = "Wrong! Thats the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
