//
//  ContentView.swift
//  BetterRest
//
//  Created by hawkeyeshi on 6/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
        
    var getBedtime: String {
        get {
            return calculateBedtime()
        }
    }
    
    let coffeeMax = 20
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Suggested Bedtime:").font(.headline).foregroundColor(.primary)) {
                    Text(getBedtime).font(.title).foregroundColor(.green)
                }
                
                Section(header: Text("When do you want to wake up?").font(.headline).foregroundColor(.primary)) {

                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: Text("Desired amount of sleep:").font(.headline).foregroundColor(.primary)) {
        
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake").font(.headline).foregroundColor(.primary)) {
                    
                    Picker(selection: $coffeeAmount, label: Text("Daily Coffee Amount")) {
                        ForEach(1...20, id: \.self) { number in
                            Text(number == 1 ? "1 cup" : "\(number) cups")
                        }
                    }
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }

    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            return formatter.string(from: sleepTime)
        } catch {
            return "Sorry, there was a problem calculating your bedtime"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

