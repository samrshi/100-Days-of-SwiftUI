//
//  ContentView.swift
//  CoreDataProject
//
//  Created by hawkeyeshi on 7/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        DynamicFiltering()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
