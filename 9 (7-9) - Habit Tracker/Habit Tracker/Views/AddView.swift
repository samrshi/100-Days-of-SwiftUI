//
//  AddView.swift
//  Habit Tracker
//
//  Created by hawkeyeshi on 7/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var habits: Habits
    @State private var newTitle = ""
    @State private var newFreq = 7
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit Title", text: $newTitle)
                
                Stepper("\(newFreq) time\(newFreq != 1 ? "s" : "") per week", value: $newFreq, in: 1...7)
            }
            .navigationBarTitle("New Habit")
            .navigationBarItems(trailing:
                Button("Add") {
                    if self.newTitle.count != 0 {
                        self.habits.habitList.append(Habit(title: self.newTitle, frequency: self.newFreq))
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        self.showingAlert.toggle()
                    }
                }
            )
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Invalid Input"), message: Text("Please enter a title"), dismissButton: .default(Text("Okay")))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
            .environment(\.colorScheme, .dark)
    }
}
