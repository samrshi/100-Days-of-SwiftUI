//
//  AstronautView.swift
//  Moonshot
//
//  Created by hawkeyeshi on 6/24/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(self.missions) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65)
                            
                            Text(mission.displayName)
                                .font(.headline)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        let missions: [Mission] = Bundle.main.decode("missions.json")
        var result = [Mission]()
        
        for mission in missions {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id }) {
                result.append(mission)
            }
        }
        
        self.missions = result
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
