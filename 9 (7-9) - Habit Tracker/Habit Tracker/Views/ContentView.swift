//
//  ContentView.swift
//  Habit Tracker
//
//  Created by hawkeyeshi on 7/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    
    @State private var showingDelete = false
    @State private var showingDeleteSheet = false
    
    @ObservedObject var habits = Habits()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Text("Habitual")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                self.showingDelete.toggle()
                            }
                        }) {
                            Image(systemName: "gear")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.vertical) {
                        
                        if showingDelete {
                            DeleteButton {
                                self.showingDeleteSheet.toggle()
                            }
                        }
                        
                        ForEach(self.habits.habitList) { habit in
                            ZStack {
                                HabitView(habits: self.habits, habit: habit, index: self.getIndex(habit) % 4)
                            }
                        }
                        .onDelete {
                            self.habits.habitList.remove(atOffsets: $0)
                        }
                        
                        Button(action: {
                            self.showSheet.toggle()
                        }) {
                            HStack {
                                Image(systemName: "plus.app")
                                Text("Add New Habit")
                            }
                            .foregroundColor(Color("blue"))
                        }
                        
                        Spacer()
                    }
                    .sheet(isPresented: self.$showSheet) {
                        AddView(habits: self.habits)
                    }
                    .actionSheet(isPresented: $showingDeleteSheet) {
                        ActionSheet(title: Text("Are you sure?"), message: Text("This will delete all habits"), buttons: [.destructive(Text("Delete")) {
                            withAnimation {
                                self.showingDelete.toggle()
                                
                                if !(self.habits.habitList.count == 0) {
                                    self.habits.habitList = [Habit]()
                                }
                            }
                            }, .cancel()
                        ])
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func getIndex(_ habit: Habit) -> Int {
        self.habits.habitList.firstIndex(where: { habit.equals(other: $0) }) ?? 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
