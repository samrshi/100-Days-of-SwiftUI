//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by hawkeyeshi on 6/13/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

public enum GameState {
    case settings
    case game
}

public struct Title: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
    }
}

public class Question {
    var domain: Int
    var range: Int
    var response: String
    var wasCorrect: Bool
    
    var answer: Int {
        domain * range
    }
    var question: String {
        "\(domain) × \(range) = "
    }
    
    init(domain d: Int, range r: Int) {
        domain = d
        range = r
        response = ""
        wasCorrect = false
    }
}

extension View {
    func title() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    @State private var state: GameState = .settings
    @State private var domainMax = 1
    @State private var numberSelection = "5"
    @State private var questions: [Question] = []
    @State private var currentQuestion = 0
    @State private var answer = ""
    @State private var score = 0
    @State private var numberOfQuestions: Int = 0
    
    @State private var answeredQuestions: [String] = []
    
    @State private var showAlert = false
    
    let numberOptions = ["5", "10", "20", "All"]
    let ranges = [1..<4, 4..<7, 7..<10]
    let range = 1...12
    
    var body: some View {
        Group {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                if state == .settings {
                    VStack {
                        Text("Multiplication")
                            .fontWeight(.black)
                            .title()
                            .padding(.vertical)
                        
                        Text("I would like to practice: ")
                            .title()
                        
                        Stepper("Up to the \(domainMax) Times Table", value: $domainMax, in: 1...12)
                            .padding(.horizontal, 25)
                            .foregroundColor(.white)
                            .font(.headline)
                            .colorScheme(.dark)
                        
                        Text("Number of questions: \(numberSelection)")
                            .title()
                        
                        Picker(selection: $numberSelection, label: Text("Number of Questions")) {
                            ForEach(numberOptions, id: \.self) { option in
                                Text("\(option)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .colorScheme(.dark)
                        .padding(.horizontal)
                        
                        Button(action: startGame) {
                            Text("Play")
                                .padding()
                                .foregroundColor(.black)
                                .font(.title)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                    .transition(.asymmetric(insertion: .scale, removal: .scale))
                } else {
                    ZStack {
                        VStack {
                            Text("Multiplication")
                                .fontWeight(.black)
                                .title()
                            
                            Text("Question: \(currentQuestion + 1) - Score: \(score)")
                                .title()
                            
                            Spacer()
                            
                            ForEach(answeredQuestions.indices.filter({ $0 >= currentQuestion - 5 }), id: \.self) { q in
                                Text(self.answeredQuestions[q])
                                    .title()
                                    .opacity(0.5)
                            }
                            
                            HStack {
                                Text(self.questions.count > 0 ? self.questions[self.currentQuestion].question : "Empty Array")
                                    .fontWeight(.black)
                                    .title()
                                
                                Text(self.answer.count == 0 ? "?" : self.answer)
                                    .foregroundColor(.green)
                                    .fontWeight(.black)
                                    .title()
                            }
                            .padding(.bottom, 30)
                            
                            VStack(spacing: 10) {
                                ForEach(0..<3) { r in
                                    HStack(spacing: 21) {
                                        ForEach(self.ranges[r]) { c in
                                            CalculatorButton(value: String(c), action: self.addToAnswer)
                                        }
                                    }
                                }
                                HStack {
                                    CalculatorButton(value: "0", action: self.addToAnswer)
                                    CalculatorButton(value: "Enter", action: self.checkAnswer)
                                }
                                HStack {
                                    CalculatorButton(value: "⬅︎") {_ in
                                        if self.answer.count > 0 {
                                            self.answer.remove(at: self.answer.index(before: self.answer.endIndex))
                                        }
                                    }
                                    CalculatorButton(value: "⟲") { _ in
                                        self.resetGame()
                                    }
                                }
                            }
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Good Job!"), message: Text("You answered \(score) questions correctly out of \(numberOfQuestions)"), dismissButton: .default(Text("Play Again"), action: resetGame))
                        }
                    }
                    .transition(.asymmetric(insertion: .scale, removal: .scale))
                }
            }
        }
    }
    
    func startGame() {
        for d in 1...domainMax {
            for r in 1...12 {
                questions.append(Question(domain: d, range: r))
            }
        }
        questions.shuffle()
        
        switch numberSelection {
        case "5":
            numberOfQuestions = 5
        case "10":
            numberOfQuestions = 10
        case "20":
            numberOfQuestions = 20
        default:
            numberOfQuestions = questions.count
        }
        
        withAnimation {
            state = .game
        }
    }
    
    func addToAnswer(_ value: String) {
        answer += value
    }
    
    func checkAnswer(_ : String) {
        let ans = Int(answer) ?? -1
        answeredQuestions.insert(questions[currentQuestion].question, at: currentQuestion)
        answeredQuestions[currentQuestion] += answer
        
        if ans == questions[currentQuestion].answer {
            score += 1
        }
        
        answer = ""
        newQuestion()
    }
    
    func newQuestion() {
        print(currentQuestion)
        if currentQuestion < questions.count - 1 && currentQuestion < numberOfQuestions - 1 {
            currentQuestion += 1
        } else {
            showAlert = true
        }
    }
    
    func resetGame() {
        withAnimation {
            state = .settings
        }
        showAlert = false
        domainMax = 1
        numberSelection = "5"
        questions = []
        currentQuestion = 0
        answer = ""
        score = 0
        numberOfQuestions = 0
        answeredQuestions = []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
