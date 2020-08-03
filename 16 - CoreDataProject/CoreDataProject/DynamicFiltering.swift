//
//  DynamicFiltering.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/23/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct DynamicFiltering: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var lastNameFilter = "A"
    
    let sortDescriptors = [
        NSSortDescriptor(keyPath: \Singer.firstName, ascending: true)
    ]
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, predicate: .beginsWith, sortDescriptors: sortDescriptors) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedlastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct DynamicFiltering_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFiltering()
    }
}
