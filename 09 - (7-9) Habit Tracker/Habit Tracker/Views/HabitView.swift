//
//  HabitView.swift
//  Habit Tracker
//
//  Created by hawkeyeshi on 7/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct HabitView: View {
    @ObservedObject var habits: Habits
    @ObservedObject var habit: Habit
    
    var index: Int
    
    @State private var bool = false
    
    @State private var showingSettings = false
    @State private var showingSheet = false
    
    let week = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let colors = ["blue", "green", "orange", "red"]
    
    var body: some View {
        VStack {
            HStack {
                Text(habit.title)
                    .fontWeight(.medium)
                    .padding(.leading, 6)
                
                Spacer()
                
                Text("\(habit.frequency) time\(habit.frequency != 1 ? "s" : "") per week")
                    .foregroundColor(.gray)
                
                if habit.achieved {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.green)
                        .transition(.asymmetric(insertion: .scale, removal: .identity))
                }
                
                settingsButton()
                
                
                if showingSettings {
                    deleteButton()
                }
            }
            
            HStack {
                ForEach(0..<week.count) { day in
                    Button(action: {
                        withAnimation {
                            self.checkAchieved(index: day)
                        }
                    }) {
                        VStack {
                            Text(self.week[day])
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            ZStack {
                                Image(systemName: "circle\(self.habit.daysDone[day] ? ".fill" : "")")
                                    .font(.title)
                                    .foregroundColor(Color(self.colors[self.index]))
                                
                                if self.habit.daysDone[day] {
                                    Image(systemName: "checkmark")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .transition(.scale)
                                }
                            }
                        }
                        .padding(.horizontal, 6)
                    }
                    
                }
                .padding(.vertical)
            }
        }
        .padding()
        .background(Color("section"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        .transition(.scale)
    }
    
    func checkAchieved(index: Int) {
        self.habit.daysDone[index].toggle()
        
        let filteredArray = self.habit.daysDone.filter({ $0 })
        
        if filteredArray.count >= self.habit.frequency {
            withAnimation {
                self.habit.achieved = true
            }
        } else {
            withAnimation {
                self.habit.achieved = false
            }
        }
    }
    
    func deleteButton() -> some View {
        Button(action: {
            withAnimation {
                self.habits.habitList.removeAll(where: { self.habit.equals(other: $0) })
                self.showingSettings.toggle()
            }
        }) {
            Image(systemName: "trash")
                .foregroundColor(Color.red)
        }
        .buttonStyle(PlainButtonStyle())
        .transition(.asymmetric(insertion: .scale, removal: .scale))
    }
    
    func settingsButton() -> some View {
        Button(action: {
            withAnimation {
                self.showingSettings.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.gray)
        }
        .rotationEffect(.degrees(showingSettings ? -90 : 0))
    }
}

#if DEBUG
struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HabitView(habits: Habits(), habit: Habit(title: "Hello", frequency: 7), index: 0)
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif
