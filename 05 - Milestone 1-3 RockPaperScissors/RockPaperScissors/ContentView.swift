//
//  ContentView.swift
//  Rock, Paper, Scissors
//
//  Created by hawkeyeshi on 6/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let options = ["👊", "✋", "✌️"]
    
    @State private var cpuChoice = Int.random(in: 0 ... 2)
    @State private var playerChoice: Int = 0
    @State private var round = 0
    @State private var shouldWin = Bool.random()
    @State private var score: Int = 0
    
    @State private var gameOver = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(options[cpuChoice])
                    .font(Font.system(size: 100))
                
                HStack {
                    Text("How would you")
                    Text(shouldWin ? "win" : "lose")
                        .foregroundColor(shouldWin ? Color.green : Color.red)
                    Text("this game?")
                }
                .font(.headline)
                .padding()
                
                HStack {
                    Button("👊", action: buttonPressed)
                    Button("✋", action: buttonPressed)
                    Button("✌️", action: buttonPressed)
                }
                .font(Font.system(size: 50))
                
                Text("Score: \(score)")
                    .fixedSize() // to prevent truncation of text (i.e. "Score...")
                    .font(.headline)
                    .padding()
            }
            .alert(isPresented: $gameOver) {
                Alert(title: Text("Game Over!"), message: Text("You ended with a score of \(score)"), dismissButton: .default(Text("Reset Game"), action: resetGame))
            }
            .navigationBarTitle("Rock, Paper, Scissors")
        }
    }
    
    func playerScored() -> Bool {
        // if player shouldWin, they are A
        // if player !shouldWin, cpu is A
        let playerAChoice = shouldWin ? playerChoice : cpuChoice
        // if player shouldWin, cpu is B
        // if player !shouldWin, player is B
        let playerBChoice = shouldWin ? cpuChoice : playerChoice
        
        let playerAWon = (playerBChoice + 1) == playerAChoice
            || (playerBChoice == 2 && playerAChoice == 0)
        
        return shouldWin == playerAWon
    }
    
    func buttonPressed() {
        if playerScored() {
            self.score += 1
        }
        
        self.round += 1
        if round == 10 {
            gameOver.toggle()
        }
        
        cpuChoice = Int.random(in: 0 ... 2)
        shouldWin = Bool.random()
    }
    
    func resetGame() {
        self.cpuChoice = Int.random(in: 0 ... 2)
        self.playerChoice = 0
        self.round = 0
        self.gameOver = false
        self.shouldWin = Bool.random()
        self.score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
