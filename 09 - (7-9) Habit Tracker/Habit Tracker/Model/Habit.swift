//
//  Habit.swift
//  Habit Tracker
//
//  Created by hawkeyeshi on 7/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

enum CodingKeys: CodingKey {
    case title
    case frequency
    case id
    case achieved
    case daysDone
}

class Habits: ObservableObject {
    @Published var habitList: [Habit] {
        didSet {
            if let encoded = try? JSONEncoder().encode(habitList) {
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
    }
    
    init() {
        if let habitList = UserDefaults.standard.data(forKey: "habits") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: habitList) {
                self.habitList = decoded
                return
            }
        }
        self.habitList = []
    }
}

class Habit: ObservableObject, Identifiable, Codable {
    var title: String
    var frequency: Int
    
    var id = UUID()
    
    @Published var achieved = false
    @Published var daysDone = [false, false, false, false, false, false, false]
    
    init(title: String, frequency: Int) {
        self.title = title
        self.frequency = frequency
    }
    
    func equals(other: Habit) -> Bool {
        self.id == other.id
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        frequency = try container.decode(Int.self, forKey: .frequency)
        id = try container.decode(UUID.self, forKey: .id)
        achieved = try container.decode(Bool.self, forKey: .achieved)
        daysDone = try container.decode([Bool].self, forKey: .daysDone)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(frequency, forKey: .frequency)
        try container.encode(id, forKey: .id)
        try container.encode(achieved, forKey: .achieved)
        try container.encode(daysDone, forKey: .daysDone)
    }
}
