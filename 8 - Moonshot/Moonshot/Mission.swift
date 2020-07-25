//
//  Mission.swift
//  Moonshot
//
//  Created by hawkeyeshi on 6/23/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        }
        return "N/A"
    }
    
    var formattedNames: String {
        var result = ""
        
        let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
        
        for crewMember in crew {
            if let match = astronauts.first(where: { $0.id == crewMember.name }) {
                result += match.name + "\n"
            }
        }
        
        return String(result.dropLast())
    }
}
