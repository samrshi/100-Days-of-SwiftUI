//
//  SwiftUI.swift
//  BucketList
//
//  Created by hawkeyeshi on 8/14/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

extension FileManager {
    func encode<T: Codable>(_ codable: T, to file: String) {
        let url = getDocumentsDirectory().appendingPathComponent(file)
        
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(codable) else {
            fatalError("Failed to encode data.")
        }
        
        do {
            try data.write(to: url)
        } catch {
            fatalError("Failed to write \(file): \(error.localizedDescription)")
        }
    }
    
    func decode<T: Codable>(_ file: String) -> T {
        let url = getDocumentsDirectory().appendingPathComponent(file)

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from document directory.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from document directory.")
        }
        
        return loaded
    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
}

struct Astronauts {
    let items: [Astronaut] = FileManager.default.decode("astronauts.json")
}

struct WritingDataChallenge: View {
    @State var astronauts = [Astronaut(id: "tap", name: "Tap to load astronuats")]
    
    var body: some View {
        List(astronauts) { astronaut in
            Text(astronaut.name)
        }
        .onAppear {
            var astronauts = [Astronaut]()
            
            astronauts.append(Astronaut(id: "grissom", name: "Virgil I. \"Gus\" Grissom"))
            astronauts.append(Astronaut(id: "white", name: "Edward H. White II"))
            astronauts.append(Astronaut(id: "chaffee", name: "Roger B. Chaffee"))
            
            FileManager.default.encode(astronauts, to: "astronauts.json")
        }
        .onTapGesture {
            self.astronauts = FileManager.default.decode("astronauts.json")
        }
    }
}

struct WritingDataChallenge_Previews: PreviewProvider {
    static var previews: some View {
        WritingDataChallenge()
    }
}
